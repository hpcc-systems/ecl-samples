IMPORT AACT;
base := AACT.File_Results_PartFlow_Mlstn_Grp;
nids := TABLE(AACT.File_Results_PartFlow_Mlstn_nid,
              {nct_id, participant_flow_id, milestone_id},
              nct_id, participant_flow_id, milestone_id, MERGE);
Results_PartFlow_Mlstn_Grp_nid := RECORD(RECORDOF(base))
  nids.nct_id;
  nids.participant_flow_id;
END;
Results_PartFlow_Mlstn_Grp_nid get_id(RECORDOF(base) b, RECORDOF(nids) n) := TRANSFORM
  SELF.nct_id := n.nct_id;
  SELF.participant_flow_id := n.participant_flow_id;
  SELF := b;
END;
with_id := JOIN(base, nids, LEFT.milestone_id=RIGHT.milestone_id,
                get_id(LEFT, RIGHT), LEFT OUTER)
         : PERSIST('PERSIST::JDH::AACT::RESULTS_PARTFLOW_MLSTN_GRP_NID');
EXPORT File_Results_PartFlow_Mlstn_Grp_nid := with_id;