/*
   The ML.Classify.DecisionTree.C45.ClassifyD takes as input
   1) indep, which is a dataset whose record layout is the same
   as indep of ML.Classify.DecisionTree.C45.LearnD; and
   2) a model created by ML.Classify.DecisionTree.C45.LearnD.
   The model is used to compute the dependent variable for
   each record of indep.

*/

   IMPORT * FROM ML;
   IMPORT ML.Mat;
   IMPORT ML.Tests.Explanatory as TE;

   weather_Data := ML.Tests.Explanatory.weatherDS;

   indep_data:= TABLE(weather_Data,{id, outlook, temperature, humidity, windy});
   dep_data:= TABLE(weather_Data,{id, play});
   indep_test:= indep_data;

   ToField(indep_data, pr_indep);
   <emphasis>indep</emphasis> := ML.Discretize.ByRounding(pr_indep);
   ToField(dep_data, pr_dep);
   dep := ML.Discretize.ByRounding(pr_dep);

   <emphasis>model</emphasis>:= ML.Classify.DecisionTree.C45().LearnD(Indep, Dep);
   OUTPUT(<emphasis>model</emphasis>,NAMED('<emphasis>model</emphasis>'));

   predict:=ML.Classify.DecisionTree.C45().ClassifyD(Indep,<emphasis>model</emphasis>);
   OUTPUT(predict,NAMED('predict'));
