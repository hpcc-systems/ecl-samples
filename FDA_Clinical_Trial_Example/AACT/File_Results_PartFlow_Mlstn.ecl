IMPORT AACT;
fName := AACT.FileName_Prefix + 'results_partflow_mlstn_txt';
Partflow_Mlstn := RECORD
  STRING MILESTONE_ID;
  STRING PARTICIPANT_FLOW_ID;
  STRING MILESTONE_TYPE;
  STRING MILESTONE_TITLE;
END;
ds := DATASET(fName, Partflow_Mlstn, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

EXPORT File_Results_PartFlow_Mlstn := ds;