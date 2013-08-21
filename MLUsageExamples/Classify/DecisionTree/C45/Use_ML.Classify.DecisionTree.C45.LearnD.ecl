/*
   The ML.Classify.DecisionTree.C45.LearnD function makes and
   returns a model that can be used to classify a dataset of
   independent variables similar to indep.

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

   model:= ML.Classify.DecisionTree.C45().LearnD(Indep, Dep);
   OUTPUT(model,NAMED('model'));
