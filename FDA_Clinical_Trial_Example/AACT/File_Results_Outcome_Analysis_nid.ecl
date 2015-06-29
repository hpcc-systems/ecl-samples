IMPORT AACT;
base := AACT.File_Results_Outcome_Analysis;
nids := TABLE(AACT.FIle_Results_Outcomes, {nct_id, outcome_id},
              nct_id, outcome_id, MERGE);
Results_Outcome_Analysis_nid := RECORD(RECORDOF(base))
  nids.nct_id;
END;
Results_Outcome_Analysis_nid get_id(RECORDOF(base) b, RECORDOF(nids) n) := TRANSFORM
  SELF.nct_id := n.nct_id;
  SELF := b;
END;
with_id := JOIN(base, nids, LEFT.outcome_id=RIGHT.outcome_id,
                get_id(LEFT, RIGHT), LEFT OUTER)
         : PERSIST('PERSIST::JDH::AACT::RESULTS_OUTCOME_ANALYSIS_NID');
EXPORT File_Results_Outcome_Analysis_nid := with_id;