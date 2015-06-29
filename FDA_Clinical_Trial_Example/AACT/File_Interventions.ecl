IMPORT AACT;
fName := AACT.FileName_Prefix + 'interventions_txt';
fixed := AACT.Fix_Broken_Records(fName, 5);

PATTERN pipe_char := '\174';
PATTERN content1  := PATTERN('[\000-\173]');
PATTERN content2  := PATTERN('[\175-\377]');
PATTERN content   := (content1 OR content2)+;
PATTERN iid_content := content;
PATTERN nid_content := content;
PATTERN intervention_type_content := content;
PATTERN intervention_name_content := content;
PATTERN description_content := content;
RULE Interventions_Rule := iid_content pipe_char
                        OPT(nid_content) pipe_char
                        OPT(intervention_type_content) pipe_char
                        OPT(intervention_name_content) pipe_char
                        OPT(description_content);

Interventions := RECORD
  STRING INTERVENTION_ID := MATCHTEXT(iid_content);
  STRING NCT_ID := MATCHTEXT(nid_content);
  STRING INTERVENTION_TYPE := MATCHTEXT(intervention_type_content);
  STRING INTERVENTION_NAME := MATCHTEXT(intervention_name_content);
  STRING DESCRIPTION := MATCHTEXT(description_content);
END;
ds := PARSE(fixed, line, Interventions_Rule, Interventions, MAX)
    : PERSIST('PERSIST::JDH::AACT::INTERVENTIONS');

EXPORT File_Interventions := ds;