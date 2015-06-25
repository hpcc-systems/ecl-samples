IMPORT AACT;
fName := AACT.FileName_Prefix + 'results_outcome_analysis_txt';
fixed := AACT.Fix_Broken_Records(fName, 19);

PATTERN pipe_char := '\174';
PATTERN content1  := PATTERN('[\000-\173]');
PATTERN content2  := PATTERN('[\175-\377]');
PATTERN content   := (content1 OR content2)+;
PATTERN roaid_content := content;
PATTERN oid_content := content;
PATTERN param_type_content := content;
PATTERN dispersion_type_content := content;
PATTERN ci_percent_content := content;
PATTERN ci_lower_limit_content := content;
PATTERN ci_upper_limit_content := content;
PATTERN groups_desc_content := content;
PATTERN non_inferiority_content := content;
PATTERN non_inferiority_desc_content := content;
PATTERN p_value_content := content;
PATTERN p_value_desc_content := content;
PATTERN method_content := content;
PATTERN method_desc_content := content;
PATTERN param_value_content := content;
PATTERN estimate_content := content;
PATTERN dispersion_value_content := content;
PATTERN ci_n_sides_content := content;
PATTERN ci_upper_limit_comment_content := content;
RULE Rslts_Outcome_Analysis_rule := roaid_content pipe_char
                            OPT(oid_content) pipe_char
                            OPT(param_type_content) pipe_char
                            OPT(dispersion_type_content) pipe_char
                            OPT(ci_percent_content) pipe_char
                            OPT(ci_lower_limit_content) pipe_char
                            OPT(ci_upper_limit_content) pipe_char
                            OPT(groups_desc_content) pipe_char
                            OPT(non_inferiority_content) pipe_char
                            OPT(non_inferiority_desc_content) pipe_char
                            OPT(p_value_content) pipe_char
                            OPT(p_value_desc_content) pipe_char
                            OPT(method_content) pipe_char
                            OPT(method_desc_content) pipe_char
                            OPT(param_value_content) pipe_char
                            OPT(estimate_content) pipe_char
                            OPT(dispersion_value_content) pipe_char
                            OPT(ci_n_sides_content) pipe_char
                            OPT(ci_upper_limit_comment_content);

Rslts_Outcome_Analysis := RECORD
  STRING RESULTS_OUTCOME_ANALYSIS_ID := MATCHTEXT(roaid_content);
  STRING OUTCOME_ID := MATCHTEXT(oid_content);
  STRING PARAM_TYPE := MATCHTEXT(param_type_content);
  STRING DISPERSION_TYPE := MATCHTEXT(dispersion_type_content);
  STRING CI_PERCENT := MATCHTEXT(ci_percent_content);
  STRING CI_LOWER_LIMIT := MATCHTEXT(ci_lower_limit_content);
  STRING CI_UPPER_LIMIT := MATCHTEXT(ci_upper_limit_content);
  STRING GROUPS_DESC := MATCHTEXT(groups_desc_content);
  STRING NON_INFERIORITY := MATCHTEXT(non_inferiority_content);
  STRING NON_INFERIORITY_DESC := MATCHTEXT(non_inferiority_desc_content);
  STRING P_VALUE := MATCHTEXT(p_value_content);
  STRING P_VALUE_DESC := MATCHTEXT(p_value_desc_content);
  STRING METHOD := MATCHTEXT(method_content);
  STRING METHOD_DESC := MATCHTEXT(method_desc_content);
  STRING PARAM_VALUE := MATCHTEXT(param_value_content);
  STRING ESTIMATE_DESC := MATCHTEXT(estimate_content);
  STRING DISPERSION_VALUE := MATCHTEXT(dispersion_value_content);
  STRING CI_N_SIDES := MATCHTEXT(ci_n_sides_content);
  STRING CI_UPPER_LIMIT_NA_COMMENT := MATCHTEXT(ci_upper_limit_comment_content);
END;
ds := PARSE(fixed, line, Rslts_Outcome_Analysis_Rule, Rslts_Outcome_Analysis, MAX)
    : PERSIST('PERSIST::JDH::AACT::RSLTS_OUTCOME_ANALYSIS');

EXPORT File_Results_Outcome_Analysis := ds;