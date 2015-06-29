IMPORT AACT;
fName := AACT.FileName_Prefix + 'intervention_arm_groups_txt';
Intervention_Arm_Grp := RECORD
  STRING INT_ARM_GROUP_ID;
  STRING INTERVENTION_ID;
  STRING NCT_ID;
  STRING ARM_GROUP_LABEL;
END;
ds := DATASET(fname, Intervention_Arm_Grp, CSV(HEADING(1),SEPARATOR('|'),TERMINATOR('\r\n')));

EXPORT File_Intervention_Arm_Grp := ds;