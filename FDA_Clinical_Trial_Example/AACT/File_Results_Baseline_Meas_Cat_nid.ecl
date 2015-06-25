IMPORT AACT;
base := AACT.File_Results_Baseline_Meas_Cat;
nids := TABLE(AACT.File_Results_Baseline_Measure_nid,
              {nct_id, rslts_baseline_id, baseline_id},
              nct_id, rslts_baseline_id, baseline_id, MERGE);
Baseline_Meas_Cat_nid := RECORD(RECORDOF(base))
  nids.nct_id;
  nids.rslts_baseline_id;
END;
Baseline_Meas_Cat_nid get_id(RECORDOF(base) b, RECORDOF(nids) n):= TRANSFORM
  SELF.nct_id := n.nct_id;
  SELF.rslts_baseline_id := n.rslts_baseline_id;
  SELF := b;
END;
with_id := JOIN(base, nids, LEFT.baseline_id=RIGHT.baseline_id,
                get_id(LEFT, RIGHT), LEFT OUTER)
         : PERSIST('PERSIST::JDH::AACT::RESULTS_BASELINE_MEAS_CAT_NID');
EXPORT File_Results_Baseline_Meas_Cat_nid := with_id;