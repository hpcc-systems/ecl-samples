IMPORT AACT;
fName := AACT.FileName_Prefix + 'references_txt';
References := RECORD
  STRING REFERENCE_ID;
  STRING NCT_ID;
  STRING REFERENCE_TYPE;
  STRING CITATION;
  STRING PMID;
END;
ds := DATASET(fName, References, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

EXPORT File_References := ds;