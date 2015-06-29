IMPORT AACT;
base := AACT.File_Results_Outcome_Meas_Cat;
nids := TABLE(AACT.File_Results_Outcome_Measure_nid,
              {nct_id, outcome_id, outcome_measure_id},
              nct_id, outcome_id, outcome_measure_id, MERGE);
Results_Outcome_Meas_Cat_nid := RECORD(RECORDOF(base))
  nids.nct_id;
  nids.outcome_id;
END;
Results_Outcome_Meas_Cat_nid get_id(RECORDOF(base) b, RECORDOF(nids) n):=TRANSFORM
  SELF.nct_id := n.nct_id;
  SELF.outcome_id := n.outcome_id;
  SELF := b;
END;
with_id := JOIN(base, nids,
                LEFT.outcome_measure_id=RIGHT.outcome_measure_id,
                get_id(LEFT, RIGHT), LEFT OUTER)
         : PERSIST('PERSIST::JDH::AACT::RESULTS_MEAS_CST_NID');
EXPORT File_Results_Outcome_Meas_Cat_nid := with_id;