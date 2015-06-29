//export ARM_ID_Analysis := 'todo';
IMPORT AACT;
id_rec := RECORD
  STRING arm_group_id;
  BOOLEAN has_Study;
  BOOLEAN has_arm_group;
  BOOLEAN has_out_anal_grp;
  BOOLEAN has_out_meas_cat;
  BOOLEAN has_base_meas_cat;
  BOOLEAN has_part_mlstn;
  BOOLEAN has_reported_ev;
END;

nids := TABLE(AACT.File_Clinical_Study, {nct_id}, nct_id, MERGE)
      + TABLE(AACT.File_Clinical_Study_noclob, {nct_id}, nct_id, MERGE);

armg:= JOIN(AACT.File_Arm_Groups, nids,
               LEFT.nct_id=RIGHT.nct_id,
               TRANSFORM(id_rec,
                         SELF.has_arm_group:=TRUE,
                         SELF.has_Study:=RIGHT.nct_id<>'',
                         SELF.arm_group_id:=LEFT.arm_group_id,
                         SELF:=[]), LEFT OUTER);
roag:= PROJECT(AACT.File_Results_Outcome_Analysis_Grp,
               TRANSFORM(id_rec,
                         SELF.has_out_anal_grp:=TRUE,
                         SELF.arm_group_id:=LEFT.arm_group_id,
                         SELF:=[]));
romc:= PROJECT(AACT.File_Results_Outcome_Meas_Cat,
               TRANSFORM(id_rec,
               SELF.has_out_meas_cat:=TRUE,
               SELF.arm_group_id:=LEFT.arm_group_id,
               SELF:=[]));
rbmc:= PROJECT(AACT.File_Results_Baseline_Meas_Cat,
               TRANSFORM(id_rec,
               SELF.has_base_meas_cat:=TRUE,
               SELF.arm_group_id:=LEFT.arm_group_id,
               SELF:=[]));
rpmg:= PROJECT(AACT.File_Results_Partflow_Mlstn_Grp,
               TRANSFORM(id_rec,
               SELF.has_part_mlstn:=TRUE,
               SELF.arm_group_id:=LEFT.arm_group_id,
               SELF:=[]));
recg:= PROJECT(AACT.File_Reported_Event_Cat_Grp,
               TRANSFORM(id_rec,
               SELF.has_reported_ev:=TRUE,
               SELF.arm_group_id:=LEFT.arm_group_id,
               SELF:=[]));

id_rec roll_rec(id_rec cumm, id_rec incr) := TRANSFORM
  SELF.arm_group_id := cumm.arm_group_id;
  SELF.has_Study := cumm.has_Study OR incr.has_Study;
  SELF.has_arm_group := cumm.has_arm_group OR incr.has_arm_group;
  SELF.has_out_anal_grp := cumm.has_out_anal_grp OR incr.has_out_anal_grp;
  SELF.has_out_meas_cat := cumm.has_out_meas_cat OR incr.has_out_meas_cat;
  SELF.has_base_meas_cat := cumm.has_base_meas_cat OR incr.has_base_meas_cat;
  SELF.has_part_mlstn := cumm.has_part_mlstn OR incr.has_part_mlstn;
  SELF.has_reported_ev := cumm.has_reported_ev OR incr.has_reported_ev;
END;

all_recs := SORT(armg+roag+romc+rbmc+rpmg+recg, arm_group_id);
rolled := ROLLUP(all_recs, roll_rec(LEFT,RIGHT), arm_group_id);

t1 := TABLE(rolled, {has_study, has_arm_group, has_out_anal_grp, has_out_meas_cat,
                      has_base_meas_cat, has_part_mlstn, has_reported_ev, c:=COUNT(GROUP)},
            has_study, has_arm_group, has_out_anal_grp, has_out_meas_cat,
                      has_base_meas_cat, has_part_mlstn, has_reported_ev, FEW, UNSORTED);

OUTPUT(SORT(t1, has_study, has_arm_group, has_out_anal_grp, has_out_meas_cat,
                      has_base_meas_cat, has_part_mlstn, has_reported_ev));
