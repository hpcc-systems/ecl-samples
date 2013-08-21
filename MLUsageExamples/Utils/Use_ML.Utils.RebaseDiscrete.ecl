/*
   The Utils.RebaseDiscrete function shifts the column-numbers
   of input_dataset so that the left-most column is now new_lowval
   This function can move colums left or right (or
   not at all)

*/

   IMPORT * FROM ML;
   A := DATASET([
                 {1,2,2},{1,3,3},
                 {2,1,4},{2,2,5},{2,3,6},
                 {3,1,7},{3,2,8},{3,3,9}
                ], ML.Types.DiscreteField);
   OUTPUT(A,NAMED('A'));

   B := ML.Utils.RebaseDiscrete(A,4);
   OUTPUT(B,NAMED('B'));
