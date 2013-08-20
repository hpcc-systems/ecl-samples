/*
   The ML.Classify.Perceptron.ClassifyD takes as input 1) indep,
   which is a dataset whose record layout is the same as
   indep of ML.Classify.Perceptron.LearnD; and 2) a model created
   by ML.Classify.Perceptron.LearnD. The model is used
   to compute the dependent variable for each record of indep.

*/

   //Perceptron Example
   // Shows the perceptron following the steps of the Wikipedia example on perceptrons
   IMPORT ML;
   d := 
      DATASET([
               {1,0, 0, 1, 1}
               , {2,0, 1, 1, 1}
               , {3,1, 0, 1, 1}
               , {4,1, 1, 0, 0}
              ],{ UNSIGNED id,UNSIGNED a, UNSIGNED b, UNSIGNED c, UNSIGNED d });
   ML.ToField(d,o);

   o1 := ML.Discretize.ByRounding(o)(id&lt;5);

   Model:=ML.Classify.Perceptron(9).LearnD(o1(Number&lt;=2),o1(number&gt;=3));
   OUTPUT(Model,NAMED('Model'));

   predict:=ML.Classify.Perceptron(9).ClassifyD(o1(Number&lt;=2),Model);
   OUTPUT(predict,NAMED('predict'));
