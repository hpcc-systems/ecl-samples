IMPORT STD;
IMPORT STD.System.Thorlib;
IMPORT AACT;

EXPORT Fix_Broken_Records(STRING fName, UNSIGNED2 num_fields) := FUNCTION
  Work0 := RECORD
    STRING line;
    UNSIGNED8 fpos{VIRTUAL(fileposition)};
  END;

  Work1 := RECORD
    UNSIGNED8 fpos;
    UNSIGNED4 node;
    UNSIGNED4 ord;
    UNSIGNED4 len;
    UNSIGNED4 flds;
    INTEGER4  lnum;   // lead number, an ID
    STRING line;
    BOOLEAN hasID;
  END;
  Work1 addStats(Work0 lr, UNSIGNED c) := TRANSFORM
    leadNumeric := REGEXFIND('^([0-9]+)[|]', lr.line, 1);
    leadNCT_Num := REGEXFIND('^NCT([0-9]+)[|]', lr.line, 1);
    SELF.fpos:= lr.fpos;
    SELF.ord := c;
    SELF.len := LENGTH(lr.line);
    SELF.flds:= 1 + STD.Str.FindCount(lr.line, '|');
    SELF.node:= ThorLib.node();
    SELF.line:= lr.line;
    SELF.lnum:= MAP(leadNumeric<>''     => (UNSIGNED4) leadNumeric,
                    leadNCT_Num<>''     => (UNSIGNED4)(leadNCT_Num),
                    -1);
    SELF.hasID := leadNumeric<>'' OR leadNCT_Num <> '';
  END;
  in_data := DATASET(fName, Work0,
                      CSV(SEPARATOR(''), QUOTE(''),TERMINATOR('\r\n'),
                          MAXLENGTH(85000), HEADING(1)));
  with_st := PROJECT(in_data, addStats(LEFT, COUNTER), LOCAL);

  // mark adjacent records to be merged
  Work1 pass1(Work1 prev, Work1 curr) := TRANSFORM
    useCurr   := prev.lnum < 1
              OR (prev.lnum > 0 AND prev.flds+curr.flds > num_fields+1)
              OR curr.lnum = prev.lnum + 1;
    SELF.lnum := IF(useCurr, curr.lnum, prev.lnum);
    SELF.node := IF(useCurr, curr.node, prev.node);
    SELF.ord  := IF(useCurr, curr.ord,  prev.ord);
    SELF.flds := IF(useCurr, curr.flds, curr.flds + prev.flds - 1);
    SELF := curr;
  END;
  prop_lnum := ITERATE(with_st, pass1(LEFT,RIGHT), LOCAL);

  // merge splits
  Work1 mrgAdj(Work1 cumm, Work1 curr) := TRANSFORM
    SELF.line := cumm.line + curr.line;
    SELF.flds := 1 + STD.Str.FindCount(cumm.line+curr.line, '|');
    SELF.len  := cumm.len + curr.len;
    SELF := cumm;
  END;

  // local merge first of adjacent records
  rolled_local := ROLLUP(prop_lnum, mrgAdj(LEFT,RIGHT), node, lnum, LOCAL);

  // determine prior node data to move up
  last_st := TABLE(DEDUP(rolled_local, TRUE, RIGHT, LOCAL), {node, lnum, ord});

  // patch first record each node with prior data
  Work1 patchLast(Work1 base, RECORDOF(last_st) nrec) := TRANSFORM
    take_nrec := nrec.lnum>0;
    SELF.node := IF(take_nrec, nrec.node, base.node);
    SELF.lnum := IF(take_nrec, nrec.lnum, base.lnum);
    SELF.ord  := IF(take_nrec, nrec.ord,  base.ord);
    SELF := base;
  END;
  patch_lnum := JOIN(rolled_local, last_st,
                     LEFT.node=RIGHT.node+1
                     AND LEFT.lnum=-1 AND LEFT.ord=1,
                     patchLast(LEFT,RIGHT), LEFT OUTER, LOOKUP);
  // NOTE: file no longer distributed by node value!

  //Use group to bring records to prior node
  in_place := GROUP(patch_lnum, node, lnum);
  rolled_in_place := UNGROUP(ROLLUP(in_place, mrgAdj(LEFT,RIGHT), node, lnum));

  //
  Work2 := RECORD
    STRING line;
    UNSIGNED4 line_len;
    UNSIGNED4 opos;
    UNSIGNED4 flds;
    UNSIGNED8 fpos;
  END;
  Work2 cvt2(Work1 lr, UNSIGNED c) := TRANSFORM
    SELF.line_len := LENGTH(lr.line);
    SELF.opos := c;
    SELF := lr;
  END;
  fixed := PROJECT(rolled_in_place, cvt2(LEFT, COUNTER), LOCAL);

  RETURN fixed;
END;