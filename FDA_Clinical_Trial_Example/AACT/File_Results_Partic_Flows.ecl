IMPORT AACT;
fName := AACT.FileName_Prefix + 'results_partic_flows_txt';
fixed := AACT.Fix_Broken_Records(fName, 5);

PATTERN pipe_char := '\174';
PATTERN content1  := PATTERN('[\000-\173]');
PATTERN content2  := PATTERN('[\175-\377]');
PATTERN content   := (content1 OR content2)+;
PATTERN pfid_content := content;
PATTERN nid_content := content;
PATTERN period_title_content := content;
PATTERN recruit_det_content := content;
PATTERN pre_assign_det_content := content;
RULE Partic_Flows_rule := pfid_content pipe_char
                      OPT(nid_content) pipe_char
                      OPT(period_title_content) pipe_char
                      OPT(recruit_det_content) pipe_char
                      OPT(pre_assign_det_content);

Partic_Flows := RECORD
  STRING PARTICIPANT_FLOW_ID  := MATCHTEXT(pfid_content);
  STRING NCT_ID               := MATCHTEXT(nid_content);
  STRING PERIOD_TITLE         := MATCHTEXT(period_title_content);
  STRING RECRUITMENT_DETAILS  := MATCHTEXT(recruit_det_content);
  STRING PRE_ASSIGNMENT_DETAILS:= MATCHTEXT(pre_assign_det_content);
END;
ds := PARSE(fixed, line, Partic_Flows_rule, Partic_Flows, MAX)
    : PERSIST('PERSIST::JDH::AACT::PARTIC_FLOWS');

EXPORT File_Results_Partic_Flows := ds;