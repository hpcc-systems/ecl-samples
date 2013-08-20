/*
   The ML.Classify.Compare.Headline definition returns the main
   precision number that shows how often the classifier was
   correct.

*/

     //classify_compare_code_example.ecl
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
                                MAP(LEFT.Val &lt; 6 =&gt; 0
                                    ,LEFT.VAL &lt; 10 =&gt; 1
                                    ,2
                                )
                        ,SELF := LEFT
              )
     );
   D1 := D+B4;
   // Using the 'discrete' classifier interface; so discretize our data first
   D2 := ML.Discretize.ByRounding(D1);
   OUTPUT(D2,NAMED('D2'));

   model:=ML.Classify.NaiveBayes.LearnD(D2(Number&lt;=3),D2(Number=4));
   predictions:=ML.Classify.NaiveBayes.ClassifyD(D2(Number&lt;=3),model);
   OUTPUT(predictions,NAMED('predictions'));

   cmp:=ML.Classify.Compare(D2(Number=4),predictions);
   OUTPUT(cmp.HeadLine,NAMED('cmp_HeadLine'));
