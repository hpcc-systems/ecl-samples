IMPORT AACT;
fname := AACT.FileName_Prefix + 'study_outcome_txt';
fixed := AACT.Fix_Broken_Records(fName, 7);

PATTERN pipe_char := '\174';
PATTERN content1  := PATTERN('[\000-\173]');
PATTERN content2  := PATTERN('[\175-\377]');
PATTERN content   := (content1 OR content2)+;
PATTERN oid_content := content;
PATTERN nid_content := content;
PATTERN study_outcomes_type_content := content;
PATTERN measure_content := content;
PATTERN safety_issue_content := content;
PATTERN time_frame_content := content;
PATTERN description_content := content;

RULE Study_Outcome_Rule := oid_content pipe_char
                    OPT(nid_content) pipe_char
                    OPT(study_outcomes_type_content) pipe_char
                    OPT(measure_content) pipe_char
                    OPT(safety_issue_content) pipe_char
                    OPT(time_frame_content) pipe_char
                    OPT(description_content);

Study_Outcome := RECORD
  STRING OUTCOME_ID := MATCHTEXT(oid_content);
  STRING NCT_ID := MATCHTEXT(nid_content);
  STRING STUDY_OUTCOMES_TYPE := MATCHTEXT(study_outcomes_type_content);
  STRING MEASURE := MATCHTEXT(measure_content);
  STRING SAFETY_ISSUE := MATCHTEXT(safety_issue_content);
  STRING TIME_FRAME := MATCHTEXT(time_frame_content);
  STRING DESCRIPTION := MATCHTEXT(description_content);
END;

ds := PARSE(fixed, line, Study_Outcome_Rule, Study_Outcome, MAX)
    : PERSIST('PERSIST::JDH::AACT::STUDY_OUTCOME');

EXPORT File_Study_Outcome := ds;