IMPORT AACT;
base := AACT.File_Results_Outcome_Analysis_Grp;
nids := TABLE(AACT.File_Results_Outcome_Analysis_nid,
             {nct_id, outcome_id, results_outcome_analysis_id},
             nct_id, outcome_id, results_outcome_analysis_id, MERGE);
nid2 := TABLE(AACT.File_Arm_Groups,
              {nct_id, arm_group_id}, nct_id, arm_group_id, MERGE);
Results_Outcome_Analysis_Grp_nid := RECORD(RECORDOF(base))
  nids.nct_id;
  nids.outcome_id;
  BOOLEAN used_arm;
  BOOLEAN nct_conflict;
  BOOLEAN arm_match;
  BOOLEAN have_arm;
END;
Results_Outcome_Analysis_Grp_nid get_id(RECORDOF(base) b, RECORDOF(nids) n):=TRANSFORM
  SELF.nct_id := n.nct_id;
  SELF.outcome_id := n.outcome_id;
  SELF.nct_conflict := FALSE;
  SELF.used_arm := FALSE;
  SELF.arm_match:= FALSE;
  SELF.have_arm := FALSE;
  SELF := b;
END;
w_id1   := JOIN(base, nids,
                LEFT.results_outcome_analysis_id=RIGHT.results_outcome_analysis_id,
                get_id(LEFT, RIGHT), LEFT OUTER);
Results_Outcome_Analysis_Grp_nid get_id2(RECORDOF(w_id1) b, RECORDOF(nid2) n):=TRANSFORM
  SELF.nct_id := IF(b.nct_id='', n.nct_id, b.nct_id);
  SELF.used_arm := b.nct_id='' AND n.nct_id<>'';
  SELF.nct_conflict := n.nct_id<>b.nct_id AND n.nct_id<>'' AND b.nct_id<>'';
  SELF.arm_match := n.nct_id = b.nct_id;
  SELF.have_arm  := n.arm_group_id <> '';
  SELF := b;
END;
w_id2   := JOIN(w_id1, nid2,
                LEFT.arm_group_id=RIGHT.arm_group_id,
                get_id2(LEFT, RIGHT), LEFT OUTER)
         : PERSIST('PERSIST::JDH::AACT::RESULTS_OUTCOME_ANALYSIS_GRP_NID');
EXPORT File_Results_Outcome_Analysis_Grp_nid := w_id2;