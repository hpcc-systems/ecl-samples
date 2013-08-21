/*
   The Types.ToMatrix function takes input_dataset of type ML.Types.NumericField
   and converts it to a dataset of type,
   ML.Mat.Types.Element, which is the record layout used by
   many matrix functions.

*/

 IMPORT ML;
 //example 1
 ChickWeightRec := RECORD
   UNSIGNED rid;
   UNSIGNED weight;
   UNSIGNED Time;
   UNSIGNED Chick;
   UNSIGNED Diet;
 END;

 ChickWeights := 
    DATASET([
             {1,42,0,1,1},
             {2,51,2,1,2},
             {3,59,4,2,1},
             {4,64,6,2,2},
             {5,76,8,3,1}
            ],ChickWeightRec);
 OUTPUT(ChickWeights,NAMED('ChickWeights'));

 // Convert ChickWeights from ChickWeightRec to ML.Types.NumericField record layout
 ML.ToField(ChickWeights,NumericFieldChickWeight)
 OUTPUT(NumericFieldChickWeight,NAMED('NumericFieldChickWeight'),all);

 // Convert ChickWeights from ML.Types.NumericField to ML.Mat.Types.Element record layout
 MatrixChickWeight := ML.Types.ToMatrix(NumericFieldChickWeight);
 OUTPUT(MatrixChickWeight,NAMED('MatrixChickWeight'),all);
