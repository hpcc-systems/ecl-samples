EXPORT Enumerations := MODULE
  EXPORT ARM_Group_Type_Class := ENUM(UNSIGNED1, Unknown=0, Control, Active, Mixed);
  Arm_Group_Type := RECORD
    STRING enum_label;
    Arm_Group_Type_Class cls;
  END;
  Arm_Group_Type_Enum := DATASET([
           {'Active Comparator', Arm_Group_Type_Class.Active}
          ,{'Baseline', Arm_Group_Type_Class.Control}
          ,{'Case', Arm_Group_Type_Class.Active}
          ,{'Control', Arm_Group_Type_Class.Control}
          ,{'Experimental', Arm_Group_Type_Class.Active}
          ,{'Exposure Comparison', Arm_Group_Type_Class.Active}
          ,{'No Intervention', Arm_Group_Type_Class.Control}
          ,{'Null', Arm_Group_Type_Class.Unknown}
          ,{'Other', Arm_Group_Type_Class.Active}
          ,{'Participant Flow', Arm_Group_Type_Class.Mixed}
          ,{'Placebo Comparator', Arm_Group_Type_Class.Control}
          ,{'Reported Event', Arm_Group_Type_Class.Mixed}
          ,{'Results Outcome', Arm_Group_Type_Class.Mixed}
          ,{'Sham Comparator', Arm_Group_Type_Class.Control}
          ,{'Treatment Comparison', Arm_Group_Type_Class.Control}
          ], Arm_Group_Type);
  Group_Type_Dict := DICTIONARY(Arm_Group_Type_Enum, {enum_label => cls});
  EXPORT Arm_Group_Type_2_Class(STRING s) := Group_Type_Dict[s].cls;
END;