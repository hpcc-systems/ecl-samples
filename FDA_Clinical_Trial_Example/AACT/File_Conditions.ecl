IMPORT AACT;
fName := AACT.FileName_Prefix + 'conditions_txt';
Conditions := RECORD
  STRING CONDITION_ID;
  STRING NCT_ID;
  STRING CONDITION;
END;
ds := DATASET(fName, Conditions, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

EXPORT File_Conditions := ds;