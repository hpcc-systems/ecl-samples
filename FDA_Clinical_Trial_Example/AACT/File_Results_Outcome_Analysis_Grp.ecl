IMPORT AACT;
fName := AACT.FileName_Prefix + 'results_outcome_analysis_grp_txt';
Outcome_Analysis_grp := RECORD
  STRING RESULTS_OUTCOME_ANAL_GRP_ID;
  STRING RESULTS_OUTCOME_ANALYSIS_ID;
  STRING ARM_GROUP_ID;
END;
ds := DATASET(fName, Outcome_Analysis_grp, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR(['\n','\r\n'])));

EXPORT File_Results_Outcome_Analysis_Grp := ds;