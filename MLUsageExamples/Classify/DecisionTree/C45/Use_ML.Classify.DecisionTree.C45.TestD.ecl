/*
   The ML.Classify.DecisionTree.C45.TestD function uses indep
   and dep to first create a model using LearnD. Then, it uses
   ClassifyD to compute estimates of the dependent variables
   given indep and the model. And finally, it compares
   dep and the computed estimates of dep using Classify.Compare.

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
   <emphasis>dep</emphasis> := ML.Discretize.ByRounding(pr_dep);

   comparison:= ML.Classify.DecisionTree.C45().TestD(Indep, Dep);
   OUTPUT(comparison);
