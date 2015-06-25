IMPORT AACT;
fName := AACT.FileName_Prefix + 'results_baseline_txt';
fixed := AACT.Fix_Broken_Records(fName, 3);


PATTERN pipe_char := '\174';
PATTERN content1  := PATTERN('[\000-\173]');
PATTERN content2  := PATTERN('[\175-\377]');
PATTERN content   := (content1 OR content2)+;
PATTERN rbid_content := content;
PATTERN nid_content  := content;
PATTERN pop_content  := content;
RULE Results_Baseline_rule := rbid_content pipe_char
                            OPT(nid_content) pipe_char
                            OPT(pop_content);
Results_Baseline := RECORD
  STRING RSLTS_BASELINE_ID    := MATCHTEXT(rbid_content);
  STRING NCT_ID               := MATCHTEXT(nid_content);
  STRING POPULATION           := MATCHTEXT(pop_content);
END;

ds := PARSE(fixed, line, Results_Baseline_rule, Results_Baseline, MAX)
    : PERSIST('PERSIST::JDH::AACT::RESULTS_BASELINE');

EXPORT File_Results_Baseline := ds;