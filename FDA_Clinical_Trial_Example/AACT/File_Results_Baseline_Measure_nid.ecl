IMPORT AACT;
base := AACT.File_Results_Baseline_Measure;
nids := TABLE(AACT.File_Results_Baseline,
              {nct_id, rslts_baseline_id},
              nct_id, rslts_baseline_id, MERGE);

Results_Baseline_Measures_nid := RECORD(RECORDOF(base))
  nids.NCT_ID;
END;
Results_Baseline_Measures_nid get_nid(RECORDOF(base) b, RECORDOF(nids) n):=TRANSFORM
  SELF.nct_id := n.nct_id;
  SELF := b;
END;
with_nid := JOIN(base, nids, LEFT.rslts_baseline_id=RIGHT.rslts_baseline_id,
                 get_nid(LEFT,RIGHT), LEFT OUTER)
          : PERSIST('PERSIST::JDH::AACT::RESULTS_BASELINE_MEASURES_NID');
EXPORT File_Results_Baseline_Measure_nid := with_nid;