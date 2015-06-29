IMPORT AACT;
fName := AACT.FileName_Prefix + 'results_baseline_measure_txt';
fixed := AACT.Fix_Broken_Records(fName, 7);

PATTERN pipe_char := '\174';
PATTERN content1  := PATTERN('[\000-\173]');
PATTERN content2  := PATTERN('[\175-\377]');
PATTERN content   := (content1 OR content2)+;
PATTERN bid_content := content;
PATTERN rbid_content := content;
PATTERN BASELINE_MEASURE_TITLE_content := content;
PATTERN DESCRIPTION_content := content;
PATTERN UNITS_OF_MEASURE_content := content;
PATTERN MEASURE_TYPE_content := content;
PATTERN DISPERSION_content := content;
RULE Baseline_Measure_rule := bid_content pipe_char
                          OPT(rbid_content) pipe_char
                          OPT(baseline_measure_title_content) pipe_char
                          OPT(description_content) pipe_char
                          OPT(units_of_measure_content) pipe_char
                          OPT(measure_type_content) pipe_char
                          OPT(dispersion_content);

Results_Baseline_Measure := RECORD
  STRING BASELINE_ID              := MATCHTEXT(bid_content);
  STRING RSLTS_BASELINE_ID        := MATCHTEXT(rbid_content);
  STRING BASELINE_MEASURE_TITLE   := MATCHTEXT(baseline_measure_title_content);
  STRING DESCRIPTION              := MATCHTEXT(description_content);
  STRING UNITS_OF_MEASURE         := MATCHTEXT(units_of_measure_content);
  STRING MEASURE_TYPE             := MATCHTEXT(measure_type_content);
  STRING DISPERSION               := MATCHTEXT(dispersion_content);
END;
ds := PARSE(fixed, line, Baseline_Measure_rule, Results_Baseline_Measure, MAX)
    : PERSIST('PERSIST::JDH::AACT::RESULTS_BASELINE_MEASURE');

EXPORT File_Results_Baseline_Measure := ds;