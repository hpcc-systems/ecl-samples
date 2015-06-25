IMPORT AACT;
fName := AACT.FileName_Prefix + 'keywords_txt';
Keywords := RECORD
  STRING KEYWORD_ID;
  STRING NCT_ID;
  STRING KEYWORD;
END;
ds := DATASET(fName, Keywords, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

EXPORT File_Keywords := ds;