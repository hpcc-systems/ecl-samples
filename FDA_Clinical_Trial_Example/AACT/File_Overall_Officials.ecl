IMPORT AACT;
fName := AACT.FileName_Prefix + 'overall_officials_txt';
Overall_Officials := RECORD
  STRING OVERALL_OFFICIAL_ID;
  STRING NCT_ID;
  STRING ROLE;
  STRING NAME_DEGREE;
  STRING AFFILIATION;
END;
ds := DATASET(fName, Overall_Officials, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

EXPORT File_Overall_Officials := ds;