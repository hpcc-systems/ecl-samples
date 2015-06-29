IMPORT AACT;
fName := AACT.FileName_Prefix + 'condition_browse_txt';
Condition_Browse := RECORD
  STRING MESH_CONDITION_ID;
  STRING NCT_ID;
  STRING MESH_TERM;
END;
ds := DATASET(fName, Condition_Browse, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

export File_Condition_Browse := ds;