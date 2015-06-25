IMPORT AACT;
fName := AACT.FileName_Prefix + 'results_outcome_measure_txt';
fixed := AACT.Fix_Broken_Records(fName, 7);

PATTERN pipe_char := '\174';
PATTERN content1  := PATTERN('[\000-\173]');
PATTERN content2  := PATTERN('[\175-\377]');
PATTERN content   := (content1 OR content2)+;
PATTERN omid_content := content;
PATTERN oid_content  := content;
PATTERN measure_title_content  := content;
PATTERN measure_desc_content  := content;
PATTERN unit_measure_content := content;
PATTERN measure_type_content := content;
PATTERN dispersion_content := content;


RULE Outcome_Measure_rule := omid_content pipe_char
                    OPT(oid_content) pipe_char
                    OPT(measure_title_content) pipe_char
                    OPT(measure_desc_content) pipe_char
                    OPT(unit_measure_content) pipe_char
                    OPT(measure_type_content) pipe_char
                    OPT(dispersion_content);

Results_Outcome_Measure := RECORD
  STRING OUTCOME_MEASURE_ID     := MATCHTEXT(omid_content);
  STRING OUTCOME_ID             := MATCHTEXT(oid_content);
  STRING OUTCOME_MEASURE_TITLE  := MATCHTEXT(measure_title_content);
  STRING MEASURE_DESCRIPTION    := MATCHTEXT(measure_desc_content);
  STRING UNIT_OF_MEASURE        := MATCHTEXT(unit_measure_content);
  STRING MEASURE_TYPE           := MATCHTEXT(measure_type_content);
  STRING DISPERSION             := MATCHTEXT(dispersion_content);
END;
ds := PARSE(fixed, line, Outcome_Measure_rule, Results_Outcome_Measure, MAX)
    : PERSIST('PERSIST::JDH::AACT::RESULTS_OUTCOME_MEASURE');

EXPORT File_Results_Outcome_Measure := ds;