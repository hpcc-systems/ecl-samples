IMPORT AACT;
fName := AACT.FileName_Prefix + 'clinical_study_noclob_txt';
fixed := AACT.Fix_Broken_Records(fName, 42);

PATTERN pipe_char := '\174';
PATTERN content1  := PATTERN('[\000-\173]');
PATTERN content2  := PATTERN('[\175-\377]');
PATTERN content   := (content1 OR content2)+;
PATTERN nid_content := content;
PATTERN DOWNLOAD_DATE_content := content;
PATTERN DOWNLOAD_DATE_DT_content := content;
PATTERN ORG_STUDY_ID_content := content;
PATTERN BRIEF_TITLE_content := content;
PATTERN OFFICIAL_TITLE_content := content;
PATTERN ACRONYM_content := content;
PATTERN SOURCE_content := content;
PATTERN HAS_DMC_content := content;
PATTERN OVERALL_STATUS_content := content;
PATTERN START_DATE_content := content;
PATTERN COMPLETION_DATE_content := content;
PATTERN COMPLETION_DATE_TYPE_content := content;
PATTERN PRIMARY_COMPLETION_DATE_content := content;
PATTERN PRIMARY_COMPLETION_DATE_TYPE_content := content;
PATTERN PHASE_content := content;
PATTERN STUDY_TYPE_content := content;
PATTERN STUDY_DESIGN_content := content;
PATTERN NUMBER_OF_ARMS_content := content;
PATTERN NUMBER_OF_GROUPS_content := content;
PATTERN ENROLLMENT_TYPE_content := content;
PATTERN ENROLLMENT_content := content;
PATTERN BIOSPEC_RETENTION_content := content;
PATTERN BIOSPEC_DESCR_content := content;
PATTERN GENDER_content := content;
PATTERN MINIMUM_AGE_content := content;
PATTERN MAXIMUM_AGE_content := content;
PATTERN HEALTHY_VOLUNTEERS_content := content;
PATTERN SAMPLING_METHOD_content := content;
PATTERN STUDY_POP_content := content;
PATTERN VERIFICATION_DATE_content := content;
PATTERN LASTCHANGED_DATE_content := content;
PATTERN FIRSTRECEIVED_DATE_content := content;
PATTERN IS_SECTION_801_content := content;
PATTERN IS_AACT_REGULATED_content := content;
PATTERN WHY_STOPPED_content := content;
PATTERN HAS_EXPANDED_ACCESS_content := content;
PATTERN FIRSTRECEIVED_RESULTS_DATE_content := content;
PATTERN URL_content := content;
PATTERN TARGET_DURATION_content := content;
PATTERN STUDY_RANK_content := content;
PATTERN LIMITATIONS_AND_CAVEATS_content := content;
RULE Clinical_Study_noclob_rule :=
     nid_content pipe_char
     OPT(DOWNLOAD_DATE_content) pipe_char
     OPT(DOWNLOAD_DATE_DT_content) pipe_char
     OPT(ORG_STUDY_ID_content) pipe_char
     OPT(BRIEF_TITLE_content) pipe_char
     OPT(OFFICIAL_TITLE_content) pipe_char
     OPT(ACRONYM_content) pipe_char
     OPT(SOURCE_content) pipe_char
     OPT(HAS_DMC_content) pipe_char
     OPT(OVERALL_STATUS_content) pipe_char
     OPT(START_DATE_content) pipe_char
     OPT(COMPLETION_DATE_content) pipe_char
     OPT(COMPLETION_DATE_TYPE_content) pipe_char
     OPT(PRIMARY_COMPLETION_DATE_content) pipe_char
     OPT(PRIMARY_COMPLETION_DATE_TYPE_content) pipe_char
     OPT(PHASE_content) pipe_char
     OPT(STUDY_TYPE_content) pipe_char
     OPT(STUDY_DESIGN_content) pipe_char
     OPT(NUMBER_OF_ARMS_content) pipe_char
     OPT(NUMBER_OF_GROUPS_content) pipe_char
     OPT(ENROLLMENT_TYPE_content) pipe_char
     OPT(ENROLLMENT_content) pipe_char
     OPT(BIOSPEC_RETENTION_content) pipe_char
     OPT(BIOSPEC_DESCR_content) pipe_char
     OPT(GENDER_content) pipe_char
     OPT(MINIMUM_AGE_content) pipe_char
     OPT(MAXIMUM_AGE_content) pipe_char
     OPT(HEALTHY_VOLUNTEERS_content) pipe_char
     OPT(SAMPLING_METHOD_content) pipe_char
     OPT(STUDY_POP_content) pipe_char
     OPT(VERIFICATION_DATE_content) pipe_char
     OPT(LASTCHANGED_DATE_content) pipe_char
     OPT(FIRSTRECEIVED_DATE_content) pipe_char
     OPT(IS_SECTION_801_content) pipe_char
     OPT(IS_AACT_REGULATED_content) pipe_char
     OPT(WHY_STOPPED_content) pipe_char
     OPT(HAS_EXPANDED_ACCESS_content) pipe_char
     OPT(FIRSTRECEIVED_RESULTS_DATE_content) pipe_char
     OPT(URL_content) pipe_char
     OPT(TARGET_DURATION_content) pipe_char
     OPT(STUDY_RANK_content) pipe_char
     OPT(LIMITATIONS_AND_CAVEATS_content);


Clinical_Study_noclob := RECORD
  STRING NCT_ID                        := MATCHTEXT(nid_content);
  STRING DOWNLOAD_DATE                 := MATCHTEXT(DOWNLOAD_DATE_content);
  STRING DOWNLOAD_DATE_DT              := MATCHTEXT(DOWNLOAD_DATE_DT_content);
  STRING ORG_STUDY_ID                  := MATCHTEXT(ORG_STUDY_ID_content);
  STRING BRIEF_TITLE                   := MATCHTEXT(BRIEF_TITLE_content);
  STRING OFFICIAL_TITLE                := MATCHTEXT(OFFICIAL_TITLE_content);
  STRING ACRONYM                       := MATCHTEXT(ACRONYM_content);
  STRING SOURCE                        := MATCHTEXT(SOURCE_content);
  STRING HAS_DMC                       := MATCHTEXT(HAS_DMC_content);
  STRING OVERALL_STATUS                := MATCHTEXT(OVERALL_STATUS_content);
  STRING START_DATE                    := MATCHTEXT(START_DATE_content);
  STRING COMPLETION_DATE               := MATCHTEXT(COMPLETION_DATE_content);
  STRING COMPLETION_DATE_TYPE          := MATCHTEXT(COMPLETION_DATE_TYPE_content);
  STRING PRIMARY_COMPLETION_DATE       := MATCHTEXT(PRIMARY_COMPLETION_DATE_content);
  STRING PRIMARY_COMPLETION_DATE_TYPE  := MATCHTEXT(PRIMARY_COMPLETION_DATE_TYPE_content);
  STRING PHASE                         := MATCHTEXT(PHASE_content);
  STRING STUDY_TYPE                    := MATCHTEXT(STUDY_TYPE_content);
  STRING STUDY_DESIGN                  := MATCHTEXT(STUDY_DESIGN_content);
  STRING NUMBER_OF_ARMS                := MATCHTEXT(NUMBER_OF_ARMS_content);
  STRING NUMBER_OF_GROUPS              := MATCHTEXT(NUMBER_OF_GROUPS_content);
  STRING ENROLLMENT_TYPE               := MATCHTEXT(ENROLLMENT_TYPE_content);
  STRING ENROLLMENT                    := MATCHTEXT(ENROLLMENT_content);
  STRING BIOSPEC_RETENTION             := MATCHTEXT(BIOSPEC_RETENTION_content);
  STRING BIOSPEC_DESCR                 := MATCHTEXT(BIOSPEC_DESCR_content);
  STRING GENDER                        := MATCHTEXT(GENDER_content);
  STRING MINIMUM_AGE                   := MATCHTEXT(MINIMUM_AGE_content);
  STRING MAXIMUM_AGE                   := MATCHTEXT(MAXIMUM_AGE_content);
  STRING HEALTHY_VOLUNTEERS            := MATCHTEXT(HEALTHY_VOLUNTEERS_content);
  STRING SAMPLING_METHOD               := MATCHTEXT(SAMPLING_METHOD_content);
  STRING STUDY_POP                     := MATCHTEXT(STUDY_POP_content);
  STRING VERIFICATION_DATE             := MATCHTEXT(VERIFICATION_DATE_content);
  STRING LASTCHANGED_DATE              := MATCHTEXT(LASTCHANGED_DATE_content);
  STRING FIRSTRECEIVED_DATE            := MATCHTEXT(FIRSTRECEIVED_DATE_content);
  STRING IS_SECTION_801                := MATCHTEXT(IS_SECTION_801_content);
  STRING IS_AACT_REGULATED              := MATCHTEXT(IS_AACT_REGULATED_content);
  STRING WHY_STOPPED                   := MATCHTEXT(WHY_STOPPED_content);
  STRING HAS_EXPANDED_ACCESS           := MATCHTEXT(HAS_EXPANDED_ACCESS_content);
  STRING FIRSTRECEIVED_RESULTS_DATE    := MATCHTEXT(FIRSTRECEIVED_RESULTS_DATE_content);
  STRING URL                           := XMLENCODE(MATCHTEXT(URL_content));
  STRING TARGET_DURATION               := MATCHTEXT(TARGET_DURATION_content);
  STRING STUDY_RANK                    := MATCHTEXT(STUDY_RANK_content);
  STRING LIMITATIONS_AND_CAVEATS       := MATCHTEXT(LIMITATIONS_AND_CAVEATS_content);
END;
ds := PARSE(fixed, line, Clinical_Study_noclob_rule, Clinical_Study_noclob, MAX)
    : PERSIST('PERSIST::JDH::AACT::CLINICAL_STUDY_NOCLOB');

EXPORT File_Clinical_Study_noclob := ds;