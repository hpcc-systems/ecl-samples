IMPORT AACT;
fName := AACT.FileName_Prefix + 'investigators_txt';
Investigators := RECORD
  STRING INVESTIGATOR_ID;
  STRING FACILITY_ID;
  STRING NCT_ID;
  STRING NAME_DEGREE;
  STRING ROLE;
  STRING AFFILIATION;
END;
ds := DATASET(fName, Investigators, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

EXPORT File_Investigators := ds;