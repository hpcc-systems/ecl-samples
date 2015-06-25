IMPORT AACT;
base := AACT.File_Results_PartFlow_Mlstn;
nids := TABLE(AACT.File_Results_Partic_Flows, {nct_id, participant_flow_id},
              nct_id, participant_flow_id, MERGE);
Results_PartFlow_Mlstn_nid := RECORD(RECORDOF(base))
  nids.nct_id;
END;
Results_PartFlow_Mlstn_nid get_id(RECORDOF(base) b, RECORDOF(nids) n) := TRANSFORM
  SELF.nct_id := n.nct_id;
  SELF := b;
END;
with_id := JOIN(base, nids, LEFT.participant_flow_id=RIGHT.participant_flow_id,
                get_id(LEFT, RIGHT), LEFT OUTER)
         : PERSIST('PERSIST::JDH::AACT::RESULTS_PARTFLOW_MLSTN_NID');
EXPORT File_Results_PartFlow_Mlstn_nid := with_id;