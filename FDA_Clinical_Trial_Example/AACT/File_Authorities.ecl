IMPORT AACT;
fName := AACT.FileName_Prefix + 'authorities_txt';
Authorities := RECORD
  STRING AUTHORITY_ID;
  STRING NCT_ID;
  STRING AUTHORITY;
END;
ds := DATASET(fName, Authorities, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

EXPORT File_Authorities := ds;