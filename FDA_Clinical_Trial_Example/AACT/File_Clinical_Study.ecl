IMPORT AACT;
fName := AACT.FileName_Prefix + 'clinical_study_txt';
fixed := AACT.Fix_Broken_Records(fName, 45);

PATTERN pipe_char := '\174';
PATTERN content1  := PATTERN('[\000-\173]');
PATTERN content2  := PATTERN('[\175-\377]');
PATTERN content   := (content1 OR content2)+;
PATTERN nid_content := content;
PATTERN dwnld_date_content := content;
PATTERN dwnld_date_dt_content := content;
PATTERN osid_content := content;
PATTERN brief_title_content := content;
PATTERN official_title_content := content;
PATTERN acronym_content := content;
PATTERN source_content := content;
PATTERN has_dmc_content := content;
PATTERN brief_summary_content := content;
PATTERN detailed_desc_content := content;
PATTERN overall_stat_content := content;
PATTERN start_date_content := content;
PATTERN compl_date_content := content;
PATTERN compl_date_type_content := content;
PATTERN pri_compl_date_content := content;
PATTERN pri_compl_date_type_content := content;
PATTERN phase_content := content;
PATTERN study_type_content := content;
PATTERN study_design_content := content;
PATTERN num_arms_content := content;
PATTERN num_grps_content := content;
PATTERN enroll_type_content := content;
PATTERN enroll_content := content;
PATTERN biospec_retention_content := content;
PATTERN biospec_descr_content := content;
PATTERN criteria_content := content;
PATTERN gender_content := content;
PATTERN min_age_content := content;
PATTERN max_age_content := content;
PATTERN healthy_vol_content := content;
PATTERN sampling_meth_content := content;
PATTERN study_pop_content := content;
PATTERN verification_date_content := content;
PATTERN lastchanged_date_content := content;
PATTERN firstreceived_date_content := content;
PATTERN is_section_801_content := content;
PATTERN is_fda_reg_content := content;
PATTERN why_stopped_content := content;
PATTERN has_exp_access_content := content;
PATTERN firstreceived_results_content := content;
PATTERN url_content := content;
PATTERN target_duration_content := content;
PATTERN study_rank_content := content;
PATTERN limitations_content := content;

Clinical_Study := RECORD
  STRING NCT_ID := MATCHTEXT(nid_content);
  STRING DOWNLOAD_DATE := MATCHTEXT(dwnld_date_content);
  STRING DOWNLOAD_DATE_DT := MATCHTEXT(dwnld_date_dt_content);
  STRING ORG_STUDY_ID := MATCHTEXT(osid_content);
  STRING BRIEF_TITLE := MATCHTEXT(brief_title_content);
  STRING OFFICIAL_TITLE := MATCHTEXT(official_title_content);
  STRING ACRONYM := MATCHTEXT(acronym_content);
  STRING SOURCE := MATCHTEXT(source_content);
  STRING HAS_DMC := MATCHTEXT(has_dmc_content);
  STRING BRIEF_SUMMARY := MATCHTEXT(brief_summary_content);
  STRING DETAILED_DESCRIPTION := MATCHTEXT(detailed_desc_content);
  STRING OVERALL_STATUS := MATCHTEXT(overall_stat_content);
  STRING START_DATE := MATCHTEXT(start_date_content);
  STRING COMPLETION_DATE := MATCHTEXT(compl_date_content);
  STRING COMPLETION_DATE_TYPE := MATCHTEXT(compl_date_type_content);
  STRING PRIMARY_COMPLETION_DATE := MATCHTEXT(pri_compl_date_content);
  STRING PRIMARY_COMPLETION_DATE_TYPE := MATCHTEXT(pri_compl_date_type_content);
  STRING PHASE := MATCHTEXT(phase_content);
  STRING STUDY_TYPE := MATCHTEXT(study_type_content);
  STRING STUDY_DESIGN := MATCHTEXT(study_design_content);
  STRING NUMBER_OF_ARMS := MATCHTEXT(num_arms_content);
  STRING NUMBER_OF_GROUPS := MATCHTEXT(num_grps_content);
  STRING ENROLLMENT_TYPE := MATCHTEXT(enroll_type_content);
  STRING ENROLLMENT := MATCHTEXT(enroll_content);
  STRING BIOSPEC_RETENTION := MATCHTEXT(biospec_retention_content);
  STRING BIOSPEC_DESCR := MATCHTEXT(biospec_descr_content);
  STRING CRITERIA := MATCHTEXT(criteria_content);
  STRING GENDER := MATCHTEXT(gender_content);
  STRING MINIMUM_AGE := MATCHTEXT(min_age_content);
  STRING MAXIMUM_AGE := MATCHTEXT(max_age_content);
  STRING HEALTHY_VOLUNTEERS := MATCHTEXT(healthy_vol_content);
  STRING SAMPLING_METHOD := MATCHTEXT(sampling_meth_content);
  STRING STUDY_POP := MATCHTEXT(study_pop_content);
  STRING VERIFICATION_DATE := MATCHTEXT(verification_date_content);
  STRING LASTCHANGED_DATE := MATCHTEXT(lastchanged_date_content);
  STRING FIRSTRECEIVED_DATE := MATCHTEXT(firstreceived_date_content);
  STRING IS_SECTION_801 := MATCHTEXT(is_section_801_content);
  STRING IS_AACT_REGULATED := MATCHTEXT(is_fda_reg_content);
  STRING WHY_STOPPED := MATCHTEXT(why_stopped_content);
  STRING HAS_EXPANDED_ACCESS := MATCHTEXT(has_exp_access_content);
  STRING FIRSTRECEIVED_RESULTS_DATE := MATCHTEXT(firstreceived_results_content);
  STRING URL := XMLENCODE(MATCHTEXT(url_content));
  STRING TARGET_DURATION := MATCHTEXT(target_duration_content);
  STRING STUDY_RANK := MATCHTEXT(study_rank_content);
  STRING LIMITATIONS_AND_CAVEATS := MATCHTEXT(limitations_content);
//	UNSIGNED8 fpos:=fixed.fpos;
//	UNSIGNED8 opos:=fixed.opos;
END;
RULE Clinical_Study_Rule := nid_content pipe_char
                     OPT(dwnld_date_content) pipe_char
                     OPT(dwnld_date_dt_content) pipe_char
                     OPT(osid_content) pipe_char
                     OPT(brief_title_content) pipe_char
                     OPT(official_title_content) pipe_char
                     OPT(acronym_content) pipe_char
                     OPT(source_content) pipe_char
                     OPT(has_dmc_content) pipe_char
                     OPT(brief_summary_content) pipe_char
                     OPT(detailed_desc_content) pipe_char
                     OPT(overall_stat_content) pipe_char
                     OPT(start_date_content) pipe_char
                     OPT(compl_date_content) pipe_char
                     OPT(compl_date_type_content) pipe_char
                     OPT(pri_compl_date_content) pipe_char
                     OPT(pri_compl_date_type_content) pipe_char
                     OPT(phase_content) pipe_char
                     OPT(study_type_content) pipe_char
                     OPT(study_design_content) pipe_char
                     OPT(num_arms_content) pipe_char
                     OPT(num_grps_content) pipe_char
                     OPT(enroll_type_content) pipe_char
                     OPT(enroll_content) pipe_char
                     OPT(biospec_retention_content) pipe_char
                     OPT(biospec_descr_content) pipe_char
                     OPT(criteria_content) pipe_char
                     OPT(gender_content) pipe_char
                     OPT(min_age_content) pipe_char
                     OPT(max_age_content) pipe_char
                     OPT(healthy_vol_content) pipe_char
                     OPT(sampling_meth_content) pipe_char
                     OPT(study_pop_content) pipe_char
                     OPT(verification_date_content) pipe_char
                     OPT(lastchanged_date_content) pipe_char
                     OPT(firstreceived_date_content) pipe_char
                     OPT(is_section_801_content) pipe_char
                     OPT(is_fda_reg_content) pipe_char
                     OPT(why_stopped_content) pipe_char
                     OPT(has_exp_access_content) pipe_char
                     OPT(firstreceived_results_content) pipe_char
                     OPT(url_content) pipe_char
                     OPT(target_duration_content) pipe_char
                     OPT(study_rank_content) pipe_char
                     OPT(limitations_content);
ds := PARSE(fixed, line, Clinical_Study_Rule, Clinical_Study, WHOLE)
    : PERSIST('PERSIST::JDH::AACT::CLINICAL_STUDY');

EXPORT File_Clinical_Study := ds;