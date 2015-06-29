IMPORT AACT;
fName := AACT.FileName_Prefix + 'intervention_browse_txt';
Intervention_Browse := RECORD
  STRING MESH_INTERVENTION_ID;
  STRING NCT_ID;
  STRING MESH_TERM;
END;
ds := DATASET(fName, Intervention_Browse, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

EXPORT File_Intervention_Browse := ds;