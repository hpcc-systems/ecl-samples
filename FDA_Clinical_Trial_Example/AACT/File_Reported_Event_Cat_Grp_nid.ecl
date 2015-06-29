IMPORT AACT;
base := AACT.File_Reported_Event_Cat_Grp;
nids := TABLE(AACT.File_Reported_Event_Ctgy_nid,
              {nct_id, reported_event_id, reported_event_category_id},
              nct_id, reported_event_id, reported_event_category_id, MERGE);
Reported_Event_Cat_Grp_nid := RECORD(RECORDOF(base))
  nids.nct_id;
  nids.reported_event_id;
END;
Reported_Event_Cat_Grp_nid get_id(RECORDOF(base) b, RECORDOF(nids) n) := TRANSFORM
  SELF.nct_id := n.nct_id;
  SELF.reported_event_id := n.reported_event_id;
  SELF := b;
END;
with_id := JOIN(base, nids, LEFT.reported_event_category_id=RIGHT.reported_event_category_id,
                get_id(LEFT, RIGHT), LEFT OUTER);
EXPORT File_Reported_Event_Cat_Grp_nid := with_id;