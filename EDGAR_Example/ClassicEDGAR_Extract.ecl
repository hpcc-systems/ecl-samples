IMPORT EDGAR_Example.Raw_Input_Files;
IMPORT EDGAR_Example.Extract_Layout;
EXPORT ClassicEDGAR_Extract := MODULE
  EXPORT Revenue       := [u'REVENUES', u'Revenues', u'NET SALES', u'Net sales', u'Total revenues'];
  EXPORT NetIncome     := [u'NET INCOME', u'Net income'];

  EXPORT Layout_Line := RECORD
    STRING        fileName;
    UNSIGNED4     line;
    UNICODE       content;
  END;

  PATTERN CR            := u'\u000D';
  PATTERN LF            := u'\u000A';
  PATTERN EndSeq        := CR LF OR LF OR CR;
  PATTERN Char          := PATTERN(U'[\u0001-\u0009\u000B\u000C\u000E-\u00FF]');
  PATTERN Content       := Char*;
  RULE Line             := Content EndSeq;

  Layout_Line makeLine(Raw_Input_Files.Layout lr) := TRANSFORM
    SELF.fileName     := lr.fileName;
    SELF.line         := 0;
    SELF.content      := MATCHUNICODE(Content);
  END;
  rawLines(STRING fileName) := PARSE(Raw_Input_Files.Files_Old_EDGAR(fileName),
                                    text, Line, makeLine(LEFT), MAX, MANY);
  enumLines(STRING fileName) := ITERATE(GROUP(rawLines(fileName), fileName, LOCAL),
                                        TRANSFORM(Layout_Line,
                                                  SELF.line := LEFT.line + 1,
                                                  SELF:=RIGHT))
                                 : ONWARNING(1037, ignore);
  EXPORT LineParse(STRING fileName) := UNGROUP(enumLines(fileName));

  EXPORT TokType := ENUM(UNSIGNED1, BeginTag, EndTag, KeyWord, Term, Number, Accession,
                          FilingType, FilingDate, ReportPeriod, WhiteSpace, Junk,
                          ColumnMap, TitleTerm, TitleNumber, CompanyName, Punctuation);
  EXPORT SubType := ENUM(UNSIGNED1, Revenue, NetIncome);
  EXPORT Layout_Token := RECORD
    STRING        fileName;
    UNSIGNED4     line;
    UNSIGNED4     tableID;    // 0 for not in a table
    UNSIGNED1     pos;        // max classic line length is 132
    UNSIGNED1     len;        // length in input
    UNSIGNED1     tabCol;     // 0 if not in a table column
    TokType       typ;
    SubType       sub;
    UNICODE       tok;
  END;

  // Line parsing patterns
  Days(UNICODE2 mm)     := CHOOSE((UNSIGNED2)mm, u'31',u'29',u'31',u'30',u'31',u'30',
                                                 u'31',u'31',u'30',u'31',u'30',u'31');
  isYear                := MATCHUNICODE BETWEEN u'1980' AND u'2015';  //xbrl by 2015
  isMonthDay            := (MATCHUNICODE[1..2] BETWEEN u'01' AND u'12')
                       AND (MATCHUNICODE[3..4] BETWEEN u'01' AND Days(MATCHUNICODE[1..2]));
  PATTERN AlphaNum      := PATTERN(U'[[:alnum:]]');
  PATTERN Letter        := PATTERN(U'[[:alpha:]]');
  PATTERN Digit         := PATTERN(U'[[:digit:]]');
  PATTERN TermChar      := AlphaNum OR u'-';
  PATTERN TermChars     := TermChar+;
  PATTERN Term          := Digit* Letter TermChar*;
  PATTERN TagName       := Letter TermChar*;
  PATTERN BeginTag      := u'<' TagName u'>';
  PATTERN EndTag        := u'</' TagName u'>';
  PATTERN Digits        := Digit+;
  PATTERN PrintInteger  := REPEAT(Digit,1,3) OPT(REPEAT(u',' Digit Digit Digit));
  PATTERN Fraction      := u'.' Digit Digit OPT(Digit);
  PATTERN NumberString  := REPEAT(Digit,4);
  PATTERN PrintNumber   := PrintInteger  OPT(Fraction);
  PATTERN Spacing       := PATTERN(U'[[:space:]]')+;
  PATTERN WhiteSpace    := PATTERN(U'[[:space:]]');
  PATTERN WhiteSpaces   := WhiteSpace+;
  PATTERN Number        := PrintNumber OR u'(' PrintNumber u')';
  PATTERN DrawLine      := u'-' REPEAT(u'-');
  PATTERN Junk          := PATTERN(U'[[:cntrl:]]') OR DrawLine;
  PATTERN Punctuation   := PATTERN(U'[[:punct:]]');
  PATTERN AccessionStr  := Digit+ u'-' Digit+ u'-' Digit+;
  PATTERN AccessionLine := FIRST u'ACCESSION NUMBER:' OPT(Spacing) AccessionStr OPT(Spacing) LAST;
  PATTERN FilingTypeStr := TermChar+ OPT(u'-' TermChar+);
  PATTERN FilingTypeLine:= FIRST u'CONFORMED SUBMISSION TYPE:' OPT(Spacing) FilingTypeStr OPT(Spacing) LAST;
  PATTERN YYYY          := VALIDATE(REPEAT(Digit, 4), isYear);
  PATTERN MMDD          := VALIDATE(REPEAT(Digit, 4), isMonthDay);
  PATTERN YYYYMMDD      := YYYY MMDD;
  PATTERN FilingDateLine:= FIRST u'FILED AS OF DATE:' Spacing YYYYMMDD OPT(Spacing) LAST;
  PATTERN RptPeriodLine := FIRST u'CONFORMED PERIOD OF REPORT:' OPT(Spacing) YYYYMMDD OPT(Spacing) LAST;
  PATTERN NameChar      := TermChar OR Punctuation;
  PATTERN NameChars     := NameChar+;
  PATTERN CompanyNameStr:= NameChars OPT(REPEAT(Spacing NameChars));
  PATTERN NameLine      := FIRST OPT(Spacing) u'COMPANY CONFORMED NAME:' OPT(Spacing) CompanyNameStr LAST;
  PATTERN ColumnTag     := [u'<C>', u'<S>'];
  PATTERN ColumnItem    := ColumnTag OPT(Spacing);
  PATTERN ColumnLine    := FIRST OPT(Spacing) ColumnItem+ LAST;
  // Table Row keywords
  PATTERN KeyWord       := Revenue OR NetIncome;



  RULE TokDef := BeginTag OR EndTag OR KeyWord OR Junk OR Term OR Number OR WhiteSpace
              OR AccessionLine OR FilingTypeLine OR FilingDateLine OR RptPeriodLine
              OR ColumnLine OR NumberString OR NameLine OR Punctuation;

  Layout_Token makeToken(Layout_Line lr) := TRANSFORM
    SELF.fileName     := lr.fileName;
    SELF.line         := lr.line;
    SELF.pos          := MATCHPOSITION;
    SELF.len          := MATCHLENGTH;
    SELF.tabCol       := 0;
    SELF.tableID      := 0;
    SELF.typ          := MAP(MATCHED(BeginTag)      => TokType.BeginTag,
                            MATCHED(EndTag)         => TokType.EndTag,
                            MATCHED(KeyWord)        => TokType.KeyWord,
                            MATCHED(WhiteSpace)     => TokType.WhiteSpace,
                            MATCHED(Term)           => TokType.Term,
                            MATCHED(Number)         => TokType.Number,
                            MATCHED(NumberString)   => TokType.Number,
                            MATCHED(AccessionLine)  => TokType.Accession,
                            MATCHED(FilingTypeLine) => TokType.FilingType,
                            MATCHED(FilingDateLine) => TokType.FilingDate,
                            MATCHED(RptPeriodLine)  => TokType.ReportPeriod,
                            MATCHED(ColumnLine)     => TokType.ColumnMap,
                            MATCHED(NameLine)       => TokType.CompanyName,
                            MATCHED(Punctuation)    => TokType.Punctuation,
                            TokType.Junk);
    SELF.tok          := MAP(MATCHED(AccessionLine)  => MATCHUNICODE(AccessionStr),
                             MATCHED(FilingTypeLine) => MATCHUNICODE(FilingTypeStr),
                             MATCHED(FilingDateLine) => MATCHUNICODE(YYYYMMDD),
                             MATCHED(RptPeriodLine)  => MATCHUNICODE(YYYYMMDD),
                             MATCHED(NameLine)       => MATCHUNICODE(CompanyNameStr),
                             MATCHUNICODE);
    SELF.sub          := MAP(MATCHUNICODE IN Revenue => SubType.Revenue,
                             MATCHUNICODE IN NetIncome=> SubType.NetIncome,
                             0);
  END;

  DATA132 ColumnMap(UNICODE str) := BEGINC++
    #option pure
    size_t pos;
    unsigned char col = 0;
    memset(__result, '\0', 132);  // init to no column
    for(pos=0; pos<132; pos++) {
      if (pos<lenStr && str[pos] == (UChar)'<') col++;
      ((unsigned char *)__result)[pos] = col;
    }
  ENDC++;

  EXPORT TokenStream(STRING fileName) := FUNCTION
    ds := LineParse(fileName);
    p0 := PARSE(ds, content, TokDef, makeToken(LEFT), MAX, MANY);
    // Need table context.  SGML does not require end tags, so we could not parse like XML.
    p1 := GROUP(p0(typ NOT IN [TokType.Junk, TokType.WhiteSpace]), fileName, LOCAL)
        : ONWARNING(1037, ignore);
    TabContext := RECORD
      UNSIGNED4       prevLine;
      UNSIGNED4       lastID;
      UNSIGNED4       currentID;
      UNSIGNED1       titleColumn;
      UNSIGNED1       nextPos;
      BOOLEAN         titleFlag;
      DATA132         colMap;
    END;
    TabContext initContextFields() := TRANSFORM
      SELF.colMap := ColumnMap(u'');
      SELF := [];
    END;
    initialContext := ROW(initContextFields());
    TabContext  trackContext(Layout_Token tok, TabContext ctx) := TRANSFORM
      BOOLEAN BeginTable := tok.typ=TokType.BeginTag AND tok.tok=u'<TABLE>';
      BOOLEAN EndTable   := tok.typ=TokType.EndTag AND tok.tok='</TABLE>';
      SELF.lastID     := IF(BeginTable, 1, 0) + ctx.lastID;
      SELF.currentID  := MAP(EndTable               => 0,
                             BeginTable             => ctx.lastID + 1,
                             ctx.currentID);
      SELF.titleFlag  := MAP(tok.tok=u'<CAPTION>'   => TRUE,
                             tok.typ=TokType.ColumnMap  => FALSE,
                             ctx.titleFlag);
      SELF.colMap     := MAP(tok.typ=TokType.ColumnMap  => ColumnMap(tok.tok),
                             tok.tok=u'<TABLE>'         => ColumnMap(u''),
                             tok.tok=u'</TABLE>'        => ColumnMap(u''),
                             tok.tok=u'<CAPTION>'       => ColumnMap(u''),
                             ctx.colMap);
      // infer title columns using spacing
      SELF.titleColumn:= MAP(NOT SELF.titleFlag         => 0,
                             tok.line <> ctx.prevLine   => 1,
                             tok.pos > ctx.nextPos      => 1 + ctx.titleColumn,
                             ctx.titleColumn);
      SELF.prevLine   := tok.line;
      SELF.nextPos    := tok.pos + tok.len + 1;   // 1 blank
    END;
    Layout_Token  assignTable(Layout_Token tok, TabContext ctx) := TRANSFORM
      BOOLEAN BeginTable := tok.typ=TokType.BeginTag AND tok.tok=u'<TABLE>';
      TitleColumn  := MAP(NOT ctx.titleFlag         => 0,
                         tok.line <> ctx.prevLine   => 1,
                         tok.pos > ctx.nextPos      => 1 + ctx.titleColumn,
                         ctx.titleColumn);
      SELF.tableID := IF(BeginTable, ctx.lastID+1, ctx.currentID);
      // A keyword is just a term if not in a table
      SELF.typ     := MAP(tok.typ=TokType.Keyword AND ctx.currentID=0 => TokType.Term,
                          tok.typ=TokType.Term AND ctx.titleFlag      => TokType.TitleTerm,
                          tok.typ=TokType.Number AND ctx.titleFlag    => TokType.TitleNumber,
                          tok.typ);
      SELF.sub     := IF(SELF.typ = tokType.Keyword, tok.sub, 0);
      SELF.tabCol  := IF(ctx.titleFlag, TitleColumn, TRANSFER(ctx.colMap[tok.pos], UNSIGNED1));
      SELF  := tok;
    END;
    p2 := PROCESS(p1, initialContext, assignTable(LEFT,RIGHT), trackContext(LEFT,RIGHT));

    Non_TableTypes := [TokType.Accession, TokType.FilingType, TokType.FilingDate,
                        TokType.ReportPeriod, TokType.CompanyName];
    p3 := p2(typ IN Non_TableTypes OR tableID > 0);

    Layout_Token roll1(Layout_Token cumm, Layout_Token tok) := TRANSFORM
      SELF.len := cumm.len + IF(cumm.pos + cumm.len < tok.pos, 1, 0) + tok.len;
      SELF.tok := cumm.tok + IF(cumm.pos + cumm.len < tok.pos, u' ' + tok.tok, tok.tok);
      SELF.typ := MAP(cumm.typ=TokType.TitleTerm      => cumm.typ,
                      tok.typ =TokType.TitleTerm      => tok.typ,
                      cumm.typ=TokType.TitleNumber    => cumm.typ,
                      cumm.typ=TokType.Punctuation    => tok.typ,   // skip punctuation types
                      cumm.typ);  // take the first, unless punction or title stuff.
      SELF.sub := IF(tok.sub<>0, tok.sub, cumm.sub);    //pick up if encountered
      SELF := cumm;     // take the first for other fields.
    END;
    p4 := ROLLUP(p3, roll1(LEFT,RIGHT), line, tabCol);  //LOCAL and by filename because it is grouped
    p5 := UNGROUP(p4);
    RETURN p5;
  END;

  EXPORT File(STRING fileName) := FUNCTION
    toks  := SORTED(DISTRIBUTED(TokenStream(fileName)), fileName, tableID, line, tabCol);
    lines := GROUP(toks, fileName, tableID, line, LOCAL)
            : ONWARNING(1037, ignore);
    // Definitions to show how muliple line row headers get put together go here.  Skip for now.
    TokenCell  := RECORD
      UNSIGNED1   tabCol;
      TokType     typ;
      UNICODE     tok;
    END;
    TokenLine := RECORD(Layout_Token)
      DATASET(TokenCell) cells;
    END;
    TokenLine roll2Line(Layout_Token column1, DATASET(Layout_Token) columns) := TRANSFORM
      SELF.cells  := PROJECT(columns(tabCol>1), TokenCell);
      SELF  := column1;
    END;
    rolledLines := UNGROUP(ROLLUP(lines, GROUP, roll2Line(LEFT, ROWS(LEFT))));

    WithEntry := RECORD(Layout_Token)
      Extract_Layout.Entry entry;
    END;
    MapElement(SubType s) := MAP(s = SubType.REvenue     => u'REVENUE',
                                 s = SubType.NetIncome   => u'NET_INCOME',
                                 u'');
    CaptionTypes := [TokType.TitleTerm, TokType.TitleNumber];
    WithEntry normLine(TokenLine line, UNSIGNED4 p) := TRANSFORM
      ContextString := INTFORMAT(line.tableID,4,1) + u'-' + INTFORMAT(line.line, 8, 1) + u'-'
                     + INTFORMAT(line.cells[p].tabCol,2, 1);
      ElementString := MAP(line.typ=TokType.Keyword     => MapElement(line.sub),
                           line.typ IN CaptionTypes     => u'', // No captions for now
                           u'');
      SELF.entry.element      := IF(EXISTS(line.cells), ElementString, u'');
      SELF.entry.contextRef   := IF(EXISTS(line.cells), ContextString, u'');
      SELF.entry.unitRef      := u'';
      SELF.entry.decimals     := u'';
      SELF.entry.content      := IF(EXISTS(line.cells), line.cells[p].tok, u'');
      SELF := line;
    END;
    normEntries := GROUP(NORMALIZE(rolledLines, MAX(COUNT(LEFT.cells), 1), normLine(LEFT,COUNTER)),
                         fileName, LOCAL) : ONWARNING(1037, ignore);

    Extract_Layout.Entry cvtEntry(WithEntry lr) := TRANSFORM
      SELF := lr.entry;
    END;
    Extract_Layout.Main rollFiling(WithEntry line1, DATASET(WithEntry) lines) := TRANSFORM
      SELF.fileName         := line1.fileName;
      SELF.accessionNumber  := lines(typ=TokType.Accession)[1].tok;
      SELF.name             := lines(typ=TokType.CompanyName)[1].tok;
      SELF.filingType       := lines(typ=TokType.FilingType)[1].tok;
      SELF.filingDate       := lines(typ=TokType.FilingDate)[1].tok;
      SELF.reportPeriod     := lines(typ=TokType.ReportPeriod)[1].tok;
      SELF.values           := PROJECT(lines(entry.element<>u''), cvtEntry(LEFT));
    END;
    extract := ROLLUP(normEntries, GROUP, rollFiling(LEFT, ROWS(LEFT)));
    RETURN extract;
  END;
END;