IMPORT AACT;
fName := AACT.FileName_Prefix + 'reported_event_ctgy_txt';
fixed := AACT.Fix_Broken_Records(fName, 6);

PATTERN pipe_char := '\174';
PATTERN content1  := PATTERN('[\000-\173]');
PATTERN content2  := PATTERN('[\175-\377]');
PATTERN content   := (content1 OR content2)+;
PATTERN recid_content := content;
PATTERN reid_content := content;
PATTERN cat_title_content := content;
PATTERN cat_sub_title_content := content;
PATTERN cat_desc_content := content;
PATTERN cat_assessment_content := content;
RULE Reported_Event_Ctgy_Rule := recid_content pipe_char
                              OPT(reid_content) pipe_char
                              OPT(cat_title_content) pipe_char
                              OPT(cat_sub_title_content) pipe_char
                              OPT(cat_desc_content) pipe_char
                              OPT(cat_assessment_content);

Reported_Event_Ctgy := RECORD
  STRING REPORTED_EVENT_CATEGORY_ID := MATCHTEXT(recid_content);
  STRING REPORTED_EVENT_ID          := MATCHTEXT(reid_content);
  STRING CATEGORY_TITLE             := MATCHTEXT(cat_title_content);
  STRING CATEGORY_SUB_TITLE         := MATCHTEXT(cat_sub_title_content);
  STRING CATEGORY_DESCRIPTION       := MATCHTEXT(cat_desc_content);
  STRING CATEGORY_ASSESSMENT        := MATCHTEXT(cat_assessment_content);
END;
ds := PARSE(fixed, line, Reported_Event_Ctgy_Rule, Reported_Event_Ctgy, MAX)
    : PERSIST('PERSIST::JDH::AACT::REPORTED_EVENT_CTGY');

EXPORT File_Reported_Event_Ctgy := ds;