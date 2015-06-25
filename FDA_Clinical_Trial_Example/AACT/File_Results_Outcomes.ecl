IMPORT STD;
IMPORT AACT;

Outcomes := RECORD
  STRING OUTCOME_ID;
  STRING NCT_ID;
  STRING OUTCOME_TYPE;
  STRING OUTCOME_TITLE;
  STRING TIME_FRAME;
  STRING SAFETY_ISSUE;
  STRING OUTCOME_DESCRIPTION;
  STRING POPULATION;
  STRING POSTING_DATE;
END;
fName := AACT.FileName_Prefix + 'results_outcomes_txt';
fixed := AACT.Fix_Broken_Records(fName, 9);

PATTERN pipe_char := '\174';
PATTERN content1  := PATTERN('[\000-\173]');
PATTERN content2  := PATTERN('[\175-\377]');
PATTERN content   := (content1 OR content2)+;
TOKEN oid_content := content;
TOKEN nid_content := content;
TOKEN otype_content := content;
TOKEN otitle_content := content;
TOKEN tframe_content := content;
TOKEN sissue_content := content;
TOKEN odesc_content := content;
TOKEN pop_content := content;
TOKEN pdate_content := content;

RULE Outcomes_rule := oid_content pipe_char
                   OPT(nid_content) pipe_char
                   OPT(otype_content) pipe_char
                   OPT(otitle_content) pipe_char
                   OPT(tframe_content) pipe_char
                   OPT(sissue_content) pipe_char
                   OPT(odesc_content) pipe_char
                   OPT(pop_content) pipe_char
                   OPT(pdate_content);
Outcomes parseOutcomes() := TRANSFORM
  SELF.OUTCOME_ID := MATCHTEXT(oid_content);
  SELF.NCT_ID := MATCHTEXT(nid_content);
  SELF.OUTCOME_TYPE := MATCHTEXT(otype_content);
  SELF.OUTCOME_TITLE := MATCHTEXT(otitle_content);
  SELF.TIME_FRAME := MATCHTEXT(tframe_content);
  SELF.SAFETY_ISSUE := MATCHTEXT(sissue_content);
  SELF.OUTCOME_DESCRIPTION := MATCHTEXT(odesc_content);
  SELF.POPULATION := MATCHTEXT(pop_content);
  SELF.POSTING_DATE := MATCHTEXT(pdate_content);
END;
ds := PARSE(fixed, line, Outcomes_rule, parseOutcomes(), MAX)
    : PERSIST('PERSIST::JDH::AACT::OUTCOMES');

EXPORT File_Results_Outcomes := ds;
