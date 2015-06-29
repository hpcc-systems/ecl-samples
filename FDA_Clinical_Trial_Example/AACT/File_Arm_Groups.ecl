IMPORT AACT;
fName := AACT.FileName_Prefix + 'arm_groups_txt';
fixed := AACT.Fix_Broken_Records(fName, 6);

PATTERN pipe_char := '\174';
PATTERN content1  := PATTERN('[\000-\173]');
PATTERN content2  := PATTERN('[\175-\377]');
PATTERN content   := (content1 OR content2)+;
PATTERN agid_content := content;
PATTERN nid_content := content;
PATTERN arm_group_label_content := content;
PATTERN arm_group_type_content := content;
PATTERN description_content := content;
PATTERN group_id_content := content;
RULE Arm_Groups_Rule := agid_content pipe_char
                    OPT(nid_content) pipe_char
                    OPT(arm_group_label_content) pipe_char
                    OPT(arm_group_type_content) pipe_char
                    OPT(description_content) pipe_char
                    OPT(group_id_content);

Arm_Groups := RECORD
  STRING ARM_GROUP_ID := MATCHTEXT(agid_content);
  STRING NCT_ID := MATCHTEXT(nid_content);
  STRING ARM_GROUP_LABEL := MATCHTEXT(arm_group_label_content);
  STRING ARM_GROUP_TYPE := MATCHTEXT(arm_group_type_content);
  STRING DESCRIPTION := MATCHTEXT(description_content);
  STRING GROUP_ID := MATCHTEXT(group_id_content);
END;
ds := PARSE(fixed, line, Arm_Groups_Rule, Arm_Groups, MAX)
    : PERSIST('PERSIST::JDH::AACT::ARM_GROUPS');

EXPORT File_Arm_Groups := ds;