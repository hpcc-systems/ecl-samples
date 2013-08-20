/*
   The ML.Classify.Perceptron.TestD function uses indep and dep
   to first create a model using LearnD. Then, it uses ClassifyD
   to compute estimates of the dependent variables given
   indep and the model. And finally, it compares dep and
   the computed estimates of dep using Classify.Compare.

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

   Comparison:=ML.Classify.Perceptron(9).TestD(o1(Number&lt;=2),o1(number&gt;=3));
   OUTPUT(comparison);
