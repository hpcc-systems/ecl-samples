/*
   The ML.Classify.Logistic.ClassifyD takes as input 1) indep,
   which is a dataset whose record layout is the same as indep
   of ML.Classify.Logistic.LearnD; and 2) a model created
   by ML.Classify.Logistic.LearnD. The model is used to compute
   the dependent variable for each record of indep.

*/

   IMPORT ML;

   value_record := RECORD
         UNSIGNED   rid;
         REAL     age;
         REAL     height;
         integer1   sex; // 0 = female, 1 = male
   END;

   d := DATASET([{1,35,149,0},{2,11,138,0},{3,12,148,1},{4,16,156,0},
                 {5,32,152,0},{6,16,157,0},{7,14,165,0},{8,8,152,1},
                 {9,35,177,0},{10,33,158,1},{11,40,166,0},{12,28,165,0},  
                 {13,23,160,0},{14,52,178,1},{15,46,169,0},{16,29,173,1},
                 {17,30,172,0},{18,21,163,0},{19,21,164,0},{20,20,189,1},
                 {21,34,182,1},{22,43,184,1},{23,35,174,1},{24,39,177,1},
                 {25,43,183,1},{26,37,175,1},{27,32,173,1},{28,24,173,1},
                 {29,20,162,0},{30,25,180,1},{31,22,173,1},{32,25,171,1}]
                 ,value_record);

   ML.ToField(d,flds0);
   f4 := 
      PROJECT(flds0(Number=3)
              ,TRANSFORM(ML.Types.NumericField
                         ,SELF.Number := 4
                         ,SELF.Value := 1-LEFT.Value
                         ,SELF := LEFT
               )
      );
   flds1 := flds0+f4;
   flds := ML.Discretize.ByRounding(flds1);

   Model3 := ML.Classify.Logistic().LearnD(flds(Number<=2),flds(Number=3));
   OUTPUT(Model3,NAMED('Model3'));

   predict:=ML.Classify.Logistic().ClassifyD(flds(Number<=2),Model3);
   OUTPUT(predict,NAMED('predict'));
