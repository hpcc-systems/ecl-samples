IMPORT AACT;
IMPORT STD;

outcomes := AACT.File_Results_Outcomes;
t_outcomes := TABLE(outcomes, {outcome_type, c:=COUNT(GROUP)}, outcome_type, FEW, UNSORTED);
OUTPUT(TOPN(t_outcomes,50,-c), NAMED('Outcome_Type_D'));
OUTPUT(ENTH(outcomes, 5), NAMED('Sample_outcomes'));


reported_events := AACT.File_Reported_Events;
t_re := TABLE(reported_events, {event_type, c:=COUNT(GROUP)}, event_type, FEW, UNSORTED);
OUTPUT(TOPN(t_re,50,-c), NAMED('Rpt_Event_Type_D'));
OUTPUT(ENTH(reported_events, 5), NAMED('Sample_Rpt_Events'));


results_baseline := AACT.File_Results_baseline;
t_rb := TABLE(results_baseline, {population, c:=COUNT(GROUP)},population, MERGE);
OUTPUT(TOPN(t_rb, 50, -c), NAMED('Top50_Baseline_Pop'));
OUTPUT(ENTH(results_baseline, 5), NAMED('Sample_results_baseline'));


rslts_outcome_meas := AACT.File_Results_Outcome_Measure;
t_rom_unit := TABLE(rslts_outcome_meas, {unit_of_measure, c:=COUNT(GROUP)},
                    unit_of_measure, FEW, UNSORTED);
OUTPUT(TOPN(t_rom_unit, 50, -c), NAMED('Top50_Rslt_Out_Meas_Unit'));
t_rom_type := TABLE(rslts_outcome_meas, {measure_type, c:=COUNT(GROUP)},
                    measure_type, FEW, UNSORTED);
OUTPUT(TOPN(t_rom_type, 50, -c), NAMED('Top50_Rslt_Out_Meas_Type'));
t_rom_disp := TABLE(rslts_outcome_meas, {dispersion, c:=COUNT(GROUP)},
                    dispersion, FEW, UNSORTED);
OUTPUT(TOPN(t_rom_disp, 50, -c), NAMED('Top50_Rslt_Out_Meas_Disp'));
OUTPUT(ENTH(rslts_outcome_meas, 5), NAMED('Sample_Rslt_outcome_meas'));


rslts_baseline_meas := AACT.File_Results_Baseline_Measure;
t_rbm_Unit := TABLE(rslts_baseline_meas, {units_of_measure, c:=COUNT(GROUP)},
                    units_of_measure, FEW, UNSORTED);
OUTPUT(TOPN(t_rbm_unit, 50, -c), NAMED('Top50_Rslt_Base_Meas_Units'));
t_rbm_type := TABLE(rslts_baseline_meas, {measure_type, c:=COUNT(GROUP)},
                    measure_type, FEW, UNSORTED);
OUTPUT(TOPN(t_rbm_type, 50, -c), NAMED('Top50_Rslt_Base_Meas_type'));
t_rbm_disp := TABLE(rslts_baseline_meas, {dispersion, c:=COUNT(GROUP)},
                    dispersion, FEW, UNSORTED);
OUTPUT(TOPN(t_rbm_disp, 50, -c), NAMED('Top50_Rslt_Base_Meas_Disp'));
OUTPUT(ENTH(rslts_baseline_meas, 5), NAMED('Sample_Rslt_Baseline_Meas'));


rslts_rstr_agreement := AACT.File_Results_Restr_Agreement;
OUTPUT(ENTH(rslts_rstr_agreement, 5), NAMED('Sample_restr_agreement'));


reported_event_ctgy := AACT.File_Reported_Event_Ctgy;
OUTPUT(ENTH(reported_event_ctgy, 5), NAMED('Sample_Rptd_Evt_Ctgy'));


clinical_study_noclob := AACT.File_Clinical_Study_noclob;
OUTPUT(ENTH(clinical_study_noclob, 5), NAMED('Sample_clinical_study_noclob'));


results_partic_flows := AACT.File_Results_Partic_Flows;
OUTPUT(ENTH(results_Partic_flows, 5), NAMED('Sample_Rslts_partic_flows'));

clinical_study := AACT.File_Clinical_Study;
OUTPUT(ENTH(clinical_study,5), NAMED('Sample_clinical_study'));

study_outcome := AACT.File_Study_Outcome;
OUTPUT(ENTH(study_outcome, 5), NAMED('Sample_Study_Outcome'));

rslts_outcome_analysis := AACT.File_Results_Outcome_Analysis;
OUTPUT(ENTH(rslts_outcome_analysis,5), NAMED('Sample_rslts_outcome_analysis'));

arm_groups := AACT.File_Arm_Groups;
OUTPUT(ENTH(arm_groups, 5), NAMED('Sample_Arm_groups'));

partflow_mlstn_grp := AACT.File_Results_PartFlow_Mlstn_Grp;
OUTPUT(ENTH(partflow_mlstn_grp, 5), NAMED('Sample_PartFlow_Mlstn_Grp'));

interventions := AACT.File_Interventions;
OUTPUT(ENTH(interventions, 5), NAMED('Sample_Interventions'));

oag := AACT.File_Results_Outcome_Analysis_Grp;
OUTPUT(COUNT(oag), NAMED('Count_Outcome_AG'));
OUTPUT(CHOOSEN(oag, 50), NAMED('Sample_OAG'));
oag_nid := AACT.File_Results_Outcome_Analysis_Grp_nid;
OUTPUT(COUNT(oag_nid), NAMED('Count_Outcome_AG_nid'));
OUTPUT(CHOOSEN(oag_nid, 50), NAMED('Sample_OAG_nid'));



removed_countries := AACT.File_Removed_Countries;
OUTPUT(ENTH(removed_countries, 20), NAMED('Sample_Removed_Countries'));
OUTPUT(COUNT(removed_countries(nct_id[1..3]<>'NCT')), NAMED('Rem_Cntry_Bad_ID'));
OUTPUT(ENTH(removed_countries(nct_id[1..3]<>'NCT'), 10), NAMED('Sample_Bad_Rem_Cntry'));


location_countries := AACT.File_Location_Countries;
OUTPUT(ENTH(location_countries, 20), NAMED('Sample_location_Countries'));
OUTPUT(COUNT(location_countries(nct_id[1..3]<>'NCT')), NAMED('Loc_Cntry_Bad_ID'));
OUTPUT(ENTH(location_countries(nct_id[1..3]<>'NCT'), 10), NAMED('Sample_Bad_Loc_Cntry'));