IMPORT AACT;
fName := AACT.FileName_Prefix + 'intervention_other_names_txt';
Intervention_Other_Names := RECORD
  STRING INT_OTHER_NAME_ID;
  STRING NCT_ID;
  STRING INTERVENTION_ID;
  STRING OTHER_NAME;
END;
ds := DATASET(fName, Intervention_Other_Names, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

export File_Intervention_Other_Names := ds;