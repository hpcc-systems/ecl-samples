/*
   The ML.Classify.NaiveBayes.TestD function uses indep and dep
   to first create a model using LearnD. Then, it uses ClassifyD
   to compute estimates of the dependent variables given
   indep and the model. And finally, it compares dep and
   the computed estimates of dep using Classify.Compare.

*/

   //NaiveBayesExampleCode.ecl
   IMPORT ML;

   // First auto-generate some test data for us to classify
   TestSize := 100000;
   a1 := ML.Distribution.Poisson(5,100);
   b1 := ML.Distribution.GenData(TestSize,a1,1); // Field.1.Uniform
   a2 := ML.Distribution.Poisson(3,100);
   b2 := ML.Distribution.GenData(TestSize,a2,2);
   a3 := ML.Distribution.Poisson(3,100);
   b3 := ML.Distribution.GenData(TestSize,a3,3);
   D := b1+b2+b3; // This.is.the.test.data

   // Now construct a fourth column which is the sum of them all
   B4 := 
      PROJECT(
              TABLE(D
                    ,{Id,Val := SUM(GROUP,Value)}
                    ,Id
              )
              ,TRANSFORM(ML.Types.NumericField
                         ,SELF.Number:=4
                         ,SELF.Value:=
                              MAP(LEFT.Val < 6 => 0
                                 ,LEFT.VAL < 10 => 1
                                 ,2
                              )
                         ,SELF := LEFT
               )
     );

   D1 := D+B4;
   // We are going to use the 'discrete' classifier interface; so discretize our data first
   D2 := ML.Discretize.ByRounding(D1);
   OUTPUT(D2,NAMED('D2'));

   comparison := ML.Classify.NaiveBayes.TestD(D2(Number<=3),D2(Number=4));
   OUTPUT(comparison);
