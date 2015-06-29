//export Review_raw_data := 'todo';
IMPORT STD;
IMPORT STD.File;

Analyze_File(fileName) := FUNCTIONMACRO
  Line_Rec := RECORD
    STRING line;
    UNSIGNED8 fpos{VIRTUAL(fileposition)};
  END;

  ds := DATASET('~'+fileName, Line_Rec, CSV(SEPARATOR(''),TERMINATOR('\r\n')));

  Line_Rec_d := RECORD
    UNSIGNED4 flds;
    UNSIGNED4 node;
    UNSIGNED8 fpos;
    INTEGER4  lnum;   // lead number, an ID
    STRING line;
  END;
  Line_Rec_e := RECORD(Line_Rec_d)
    STRING name;
    BOOLEAN hasID;
  END;

  Line_Rec_e getData(Line_Rec lr) := TRANSFORM
    leadNumeric := REGEXFIND('^([0-9]+)[|]', lr.line, 1);
    SELF.flds := 1 + STD.Str.FindCount(lr.line, '|');
    SELF.node := STD.System.ThorLib.node();
    SELF.lnum := IF(leadNumeric<>'', (UNSIGNED4) leadNumeric, -1);
    SELF.name := fileName[44..];
    SELF.hasID:= leadNumeric <> '';
    SELF := lr;
  END;
  es := PROJECT(ds(fpos>0), getData(LEFT));
  cs := PROJECT(ds(fpos=0), getData(LEFT));
  Base_Tab := RECORD
    es.flds;
    es.hasID;
    UNSIGNED4 min_id := MIN(GROUP, es.lnum);
    UNSIGNED4 max_id := MAX(GROUP, es.lnum);
    UNSIGNED4 c:=COUNT(GROUP);
  END;
  Tab_Rec := RECORD(Base_Tab)
    es.name;
  END;
  t0 := TABLE(es, Tab_Rec, name, flds, hasID, FEW, UNSORTED);
  s0 := cs & UNGROUP(TOPN(GROUP(es, name, hasID, flds, ALL), 3, -node, -fpos));
  Final_Report := RECORD
    STRING name;
    STRING colNames;
    UNSIGNED4 cols;
    UNSIGNED4 rec_count;
    UNSIGNED4 min_id;
    UNSIGNED4 max_id;
    UNSIGNED4 min_w_id;
    UNSIGNED4 max_w_id;
    UNSIGNED4 min_wo_id;
    UNSIGNED4 max_wo_id;
    DATASET(Base_Tab) s_tab;
    DATASET(Line_Rec_d) samples;
  END;
  Final_Report bldReport(Line_Rec_e frec, DATASET(Line_Rec_e) rws) := TRANSFORM
    SELF.name := frec.name;
    SELF.colNames := frec.line;
    SELF.cols := frec.flds;
    SELF.samples := PROJECT(rws(fpos>0), Line_Rec_d);
    SELF := [];
  END;
  s1 := ROLLUP(GROUP(s0, name, ALL), GROUP, bldReport(LEFT, ROWS(LEFT)));
  Final_Report addStats(Final_Report fr, DATASET(Tab_Rec) tab) := TRANSFORM
    SELF.s_tab := SORT(PROJECT(tab, Base_Tab), hasID, -c);
    SELF.rec_count := SUM(tab, c);
    SELF.min_id    := MIN(tab(hasID), min_id);
    SELF.max_id    := MAX(tab(hasID), max_id);
    SELF.min_w_id  := MIN(tab(hasID), flds);
    SELF.max_w_id  := MAX(tab(hasID), flds);
    SELF.min_wo_id := MIN(tab(NOT hasID), flds);
    SELF.max_wo_id := MAX(tab(NOT hasID), flds);
    SELF := fr;
  END;
  s2 := DENORMALIZE(s1, t0, LEFT.name=RIGHT.name, GROUP, addStats(LEFT, ROWS(RIGHT)));
  RETURN OUTPUT(s2, NAMED('AACT_Data'), EXTEND);
ENDMACRO;

Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_results_outcomes_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_reported_events_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_results_restriction_agreement_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_reported_event_ctgy_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_clinical_study_noclob_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_results_partic_flows_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_clinical_study_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_study_outcome_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_results_outcome_analysis_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_arm_groups_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_results_baseline_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_results_partflow_mlstn_grp_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_results_outcome_measure_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_interventions_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_results_baseline_measure_txt');


Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_references_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_intervention_browse_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_results_partflow_mlstn_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_facility_contacts_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_mesh_thesaurus_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_central_contacts_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_results_outcome_analysis_grp_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_investigators_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_sponsors_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_intervention_other_names_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_authorities_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_condition_browse_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_intervention_arm_groups_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_responsible_parties_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_conditions_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_facilities_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_removed_countries_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_overall_officials_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_keywords_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_secondary_ids_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_nct_aliases_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_results_outcome_measure_ctgy_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_results_baseline_measure_catgy_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_location_countries_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_results_point_of_contact_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_designs_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_reported_event_ctgy_grp_txt');
Analyze_File('thor::jdh::fda_clinical_trials::AACT201409_links_txt');
