IMPORT AACT;
base := AACT.File_Reported_Event_Ctgy;
nids := TABLE(AACT.File_Reported_Events, {nct_id, reported_event_id},
              nct_id, reported_event_id, MERGE);
Reported_Event_Ctgy_nid := RECORD(RECORDOF(base))
  nids.nct_id;
END;
Reported_Event_Ctgy_nid get_id(RECORDOF(base) b, RECORDOF(nids) n) := TRANSFORM
  SELF.nct_id := n.nct_id;
  SELF := b;
END;
with_id := JOIN(base, nids, LEFT.reported_event_id=RIGHT.reported_event_id,
                get_id(LEFT, RIGHT), LEFT OUTER)
         : PERSIST('PERSIST::JDH::AACT::REPORTED_EVENT_CTGY_NID');
EXPORT File_Reported_Event_Ctgy_nid := with_id;