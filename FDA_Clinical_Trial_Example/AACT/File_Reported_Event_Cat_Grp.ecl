IMPORT AACT;
fName := AACT.FileName_Prefix + 'reported_event_ctgy_grp_txt';
Reported_Event_Cat_Grp := RECORD
  STRING REPORTED_EVENT_CATGY_GRP_ID;
  STRING REPORTED_EVENT_CATEGORY_ID;
  STRING ARM_GROUP_ID;
  STRING SUBJECTS_AFFECTED;
  STRING SUBJECTS_AT_RISK;
  STRING EVENTS;
END;

ds := DATASET(fName, Reported_Event_Cat_Grp, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

export File_Reported_Event_Cat_Grp := DS;