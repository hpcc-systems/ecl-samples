/*
   The ML.Classify.DecisionTree.GiniImpurityBased.ClassifyD takes
   as input 1) indep, which is a dataset whose record layout
   is the same as indep of ML.Classify.DecisionTree.GiniImpurityBased.LearnD;
   and 2) a model created by ML.Classify.DecisionTree.GiniImpurityBased.LearnD.
   The model is
   used to compute the dependent variable for each record of
   indep.

*/

   IMPORT * FROM ML;
   IMPORT ML.Mat;
   IMPORT ML.Tests.Explanatory as TE;

   //This is the tennis-weather dataset transformed to discrete number values.
   weatherRecord := RECORD
     Types.t_RecordID id;
     Types.t_FieldNumber outlook;
     Types.t_FieldNumber temperature;
     Types.t_FieldNumber humidity;
     Types.t_FieldNumber windy;
     Types.t_FieldNumber play;
   END;

   weather_Data := DATASET([
                            {1,0,0,1,0,0},
                            {2,0,0,1,1,0},
                            {3,1,0,1,0,1},
                            {4,2,1,1,0,1},
                            {5,2,2,0,0,1},
                            {6,2,2,0,1,0},
                            {7,1,2,0,1,1},
                            {8,0,1,1,0,0},
                            {9,0,2,0,0,1},
                            {10,2,1,0,0,1},
                            {11,0,1,0,1,1},
                            {12,1,1,1,1,1},
                            {13,1,0,0,0,1},
                            {14,2,1,1,1,0}
                            ],weatherRecord);

   indep_data:= TABLE(weather_Data,{id, outlook, temperature, humidity, windy});
   dep_data:= TABLE(weather_Data,{id, play});

   ToField(indep_data, pr_indep);
   <emphasis>indep</emphasis> := ML.Discretize.ByRounding(pr_indep);
   ToField(dep_data, pr_dep);
   dep := ML.Discretize.ByRounding(pr_dep);

   <emphasis>model</emphasis>:= ML.Classify.DecisionTree.GiniImpurityBased(5, 1).LearnD(Indep, Dep);
   OUTPUT(<emphasis>model</emphasis>,NAMED('<emphasis>model</emphasis>'));

   predict := ML.Classify.DecisionTree.GiniImpurityBased(5, 1).ClassifyD(Indep, <emphasis>model</emphasis>);
   OUTPUT(predict,NAMED('predict'));
