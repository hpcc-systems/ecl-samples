//export NCT_ID_Analysis := 'todo';

IMPORT AACT;
Extract_Result := RECORD
  STRING file;
  STRING NCT_ID;
END;
empty := DATASET([], Extract_Result);

Extract_ID(file_attr, lit) := FUNCTIONMACRO
  Extract_Result ex(RECORDOF(file_attr) lr) := TRANSFORM
    SELF.file := lit;
    SELF.NCT_ID := lr.nct_id;
  END;
  ds := PROJECT(file_attr, ex(LEFT));
  RETURN ds;
ENDMACRO;

ds00 := Extract_ID(AACT.File_Arm_Groups, 'Arm_Groups');
ds01 := Extract_ID(AACT.File_Authorities, 'Authorities');
ds02 := Extract_ID(AACT.File_Central_Contacts, 'Central_Contacts');
ds03 := Extract_ID(AACT.File_Clinical_Study_noclob, 'Clinical_Study_noclob');
ds04 := Extract_ID(AACT.File_Clinical_Study, 'Clinical_Study');
ds05 := Extract_ID(AACT.File_Condition_Browse, 'Condition_Browse');
ds06 := Extract_ID(AACT.File_Conditions, 'Conditions');
ds07 := Extract_ID(AACT.File_Designs, 'Designs');
ds08 := Extract_ID(AACT.File_Facilities, 'Facilities');
ds09 := Extract_ID(AACT.File_Facility_Contacts, 'Facility_Contracts');
ds10 := Extract_ID(AACT.File_Intervention_Arm_Grp, 'Intervention_Arm_grp');
ds11 := Extract_ID(AACT.File_Intervention_Browse, 'Intervention_Browse');
ds12 := Extract_ID(AACT.File_Intervention_Other_Names, 'Intervention_Other_Names');
ds13 := Extract_ID(AACT.File_Interventions, 'Interventions');
ds14 := Extract_ID(AACT.File_Investigators, 'Investigators');
ds15 := Extract_ID(AACT.File_Keywords, 'Keywords');
ds16 := Extract_ID(AACT.File_Links, 'Links');
ds17 := Extract_ID(AACT.File_Location_Countries, 'Location_Countries');
ds18 := PROJECT(AACT.File_Mesh_Thesaurus, TRANSFORM(Extract_Result, SELF.file:='Mesh_Thesaurus', SELF:=[]));
ds19 := Extract_ID(AACT.File_NCT_Alias, 'NCT_Alias');
ds20 := Extract_ID(AACT.File_Overall_Officials, 'Overall_Officials');
ds21 := Extract_ID(AACT.File_References, 'References');
ds22 := Extract_ID(AACT.File_Removed_Countries, 'Removed_Countries');
ds23 := Extract_ID(AACT.File_Reported_Event_Cat_Grp_nid, 'Reported_Event_Cat_Grp');
ds24 := Extract_ID(AACT.File_Reported_Event_Ctgy_nid, 'Reported_Event_Ctgy');
ds25 := Extract_ID(AACT.File_Reported_Events, 'Reported_Events');
ds26 := Extract_ID(AACT.File_Responsible_Parties, 'Responsble_Parties');
ds27 := Extract_ID(AACT.File_Results_Baseline_Meas_Cat_nid, 'Results_Baseline_Measure_Cat');
ds28 := Extract_ID(AACT.File_Results_Baseline_Measure_nid, 'Results_Baseline_Measure');
ds29 := Extract_ID(AACT.File_Results_Baseline, 'Results_Baseline');
ds30 := Extract_ID(AACT.File_Results_Outcome_Analysis_Grp_nid, 'Results_Outcome_Analysis_Grp');
ds31 := Extract_ID(AACT.File_Results_Outcome_Analysis_nid, 'Results_Outcome_Analysis');
ds32 := Extract_ID(AACT.File_Results_Outcome_Meas_Cat_nid, 'Results_Outcome_Meas_Cat');
ds33 := Extract_ID(AACT.File_Results_Outcome_Measure_nid, 'Results_Outcome_Measure');
ds34 := Extract_ID(AACT.File_Results_Outcomes, 'Results_Outcomes');
ds35 := Extract_ID(AACT.File_Results_PartFlow_Mlstn_Grp_nid, 'Results_PartFlow_Mlstn_Grp');
ds36 := Extract_ID(AACT.File_Results_PartFlow_Mlstn_nid, 'Results_PartFlow_Mlstn');
ds37 := Extract_ID(AACT.File_Results_Partic_Flows, 'Results_Partic_Flows');
ds38 := Extract_ID(AACT.File_Results_Point_Contact, 'Results_Point_Contact');
ds39 := Extract_ID(AACT.File_Results_Restr_Agreement, 'Results_Restr_Agreement');
ds40 := Extract_ID(AACT.File_Secondary_ids, 'Secondary_ids');
ds41 := Extract_ID(AACT.File_Sponsors, 'Sponsors');
ds42 := Extract_ID(AACT.File_Study_Outcome, 'Study_Outcome');

raw_ds := ds00+ds01+ds02+ds03+ds04+ds05+ds06+ds07+ds08+ds09
         +ds10+ds11+ds12+ds13+ds14+ds15+ds16+ds17+ds18+ds19
         +ds20+ds21+ds22+ds23+ds24+ds25+ds26+ds27+ds28+ds29
         +ds30+ds31+ds32+ds33+ds34+ds35+ds36+ds37+ds38+ds39
         +ds40+ds41+ds42;

all_ds := raw_ds(nct_id<>'');

t0 := TABLE(all_ds, {file, c:=COUNT(GROUP)}, file, FEW, UNSORTED);
OUTPUT(SORT(t0, file), NAMED('Record_COUNTS_with_nct'));

t1 := TABLE(all_ds, {file, nct_id, c:=COUNT(GROUP)}, file, nct_id, MERGE);
t2 := TABLE(t1, {nct_id, files:=COUNT(GROUP)}, nct_id, MERGE);
t_count := TABLE(t2, {files, ids:=COUNT(GROUP)}, files, FEW, UNSORTED);
OUTPUT(SORT(t_count, files), NAMED('Coverage_Dist_Files'));

j1 := JOIN(t1, t2(files=1), LEFT.nct_id=RIGHT.nct_id, LOOKUP);
OUTPUT(TOPN(j1, 200, file, nct_id), ALL, NAMED('Singleton_NCT'));
t_j1 := TABLE(j1, {file, freq:=COUNT(GROUP)}, file, FEW, UNSORTED);
OUTPUT(SORT(t_j1, file), NAMED('Singleton_By_File'));

t_3 := TABLE(t1, {file, ids:=COUNT(GROUP), mn:=MIN(GROUP,c),
                  mx:=MAX(GROUP,c), av:=AVE(GROUP,c), recs:=SUM(GROUP,c)},
             file, FEW, UNSORTED);
OUTPUT(SORT(t_3, file), NAMED('ID_Cardinality'));

src_code(STRING file) := CASE(file,
                            'Clinical_Study_noclob'   => 1,
                            'Clinical_Study'          => 2,
                            4);
src_str(UNSIGNED1 code) := CASE(code,
                                1     => 'Noclob only',
                                2     => 'full only',
                                3     => 'both',
                                'data error');
s1 := TABLE(ds03+ds04, {nct_id, UNSIGNED1 flag:=src_code(file)});
s2 := TABLE(DISTRIBUTE(s1, HASH32(nct_id)), {nct_id, c:=SUM(GROUP,flag)}, nct_id, MERGE);
s3 := TABLE(s2, {STRING S:=src_str(c), f:=COUNT(GROUP)}, src_str(c), FEW, UNSORTED);
OUTPUT(SORT(s3, f), NAMED('ID_Source'));

t_no_id := TABLE(raw_ds(nct_id=''), {file, c:=COUNT(GROUP)}, file, FEW, UNSORTED);
OUTPUT(SORT(t_no_id, file), NAMED('NO_ID_COUNTS'));

t_all := TABLE(raw_ds, {file, all_recs:=COUNT(GROUP)}, file, FEW, UNSORTED);
OUTPUT(SORT(t_all, file), NAMED('Record_Counts'));
OUTPUT(COUNT(raw_ds), NAMED('Total_Record_Count'));

{t0.file, t0.c, t_all.all_recs, REAL8 p} x(t0 lr, t_all rr) := TRANSFORM
  SELF.p := lr.c / rr.all_recs;
  SELF := lr;
  SELF := rr;
END;
t_merge := JOIN(t0, t_all, LEFT.file=RIGHT.file, x(LEFT,RIGHT));
OUTPUT(SORT(t_merge, file), NAMED('Merged_Counts'));

base_list := TABLE(ds03+ds04, {file, nct_id}, file, nct_id, MERGE);
all_F_ids := TABLE(all_ds, {file, nct_id, recs:=COUNT(GROUP)}, file, nct_id, MERGE);
miss1 := JOIN(all_F_ids, base_list, LEFT.nct_id=RIGHT.nct_id, LOOKUP, LEFT ONLY);
alias_list := TABLE(AACT.File_NCT_Alias, {nct_alias}, nct_alias, MERGE);
missing := JOIN(miss1, alias_list, LEFT.nct_id=RIGHT.nct_alias, LOOKUP, LEFT ONLY);

t_missing_src := TABLE(missing, {file, ids:=COUNT(GROUP), tot_recs:=SUM(GROUP,recs)}, file, FEW, UNSORTED);
OUTPUT(SORT(t_missing_src, file), NAMED('Missing_by_file'));

t_missing_c := TABLE(missing, {nct_id, files:=COUNT(GROUP), tot_recs:=SUM(GROUP,recs)}, nct_id, MERGE);
OUTPUT(COUNT(t_missing_c), NAMED('ID_not_in_Clinical_Study'));
OUTPUT(TOPN(t_missing_c, 20, -tot_recs), NAMED('Selected_Missing'));
OUTPUT(TOPN(t_missing_c, 20, -tot_recs),,'JDH::AACT::MISSING_NCT::CSV',
       CSV(HEADING(SINGLE)), OVERWRITE);

t_id_dist := TABLE(t_missing_c, {files, f:=COUNT(GROUP)}, files, FEW, UNSORTED);
OUTPUT(SORT(t_id_dist, files), NAMED('missing_id_files'));