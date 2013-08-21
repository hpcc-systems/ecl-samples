/*
   The ML.Classify.Perceptron.LearnD function makes and returns
   a model that can be used to classify a dataset of independent
   variables similar to indep.

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

   o1 := ML.Discretize.ByRounding(o)(id<5);

   Model:=ML.Classify.Perceptron(9).LearnD(o1(Number<=2),o1(number>=3));
   OUTPUT(Model,NAMED('Model'));
