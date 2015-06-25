IMPORT AACT;
fName := AACT.FileName_Prefix + 'results_partflow_mlstn_grp_txt';
fixed := AACT.Fix_Broken_Records(fName, 5);

PATTERN pipe_char := '\174';
PATTERN content1  := PATTERN('[\000-\173]');
PATTERN content2  := PATTERN('[\175-\377]');
PATTERN content   := (content1 OR content2)+;
PATTERN mgid_content := content;
PATTERN mid_content := content;
PATTERN agid_content := content;
PATTERN partflow_count_content := content;
PATTERN participant_description_content := content;
RULE PartFlow_Mlstn_Grp_Rule := mgid_content pipe_char
                            OPT(mid_content) pipe_char
                            OPT(agid_content) pipe_char
                            OPT(partflow_count_content) pipe_char
                            OPT(participant_description_content);

PartFlow_Mlstn_Grp := RECORD
  STRING MILESTONE_GROUP_ID := MATCHTEXT(mgid_content);
  STRING MILESTONE_ID := MATCHTEXT(mid_content);
  STRING ARM_GROUP_ID := MATCHTEXT(agid_content);
  STRING PARTFLOW_COUNT := MATCHTEXT(partflow_count_content);
  STRING PARTICIPANT_DESCRIPTION := MATCHTEXT(participant_description_content);
END;
ds := PARSE(fixed, line, PartFlow_Mlstn_Grp_Rule, PartFlow_Mlstn_Grp, MAX)
    : PERSIST('PERSIST::JDH::AACT::PARTFLOW_MLSTN_GRP');

EXPORT File_Results_PartFlow_Mlstn_Grp := ds;