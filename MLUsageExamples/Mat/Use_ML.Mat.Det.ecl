/*
   The ML.Mat.Det function calculates and returns the determinant
   of input_matrix.

*/

   IMPORT * FROM ML;
   A := DATASET([
                 {1,1,2.0},{1,2,2.0},{1,3,2.0},
                 {2,1,2.0},{2,2,2.0},{2,3,2.0},
                 {3,1,2.0},{3,2,2.0},{3,3,2.0}], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));

   DetA := ML.Mat.Det(A);
   OUTPUT(DetA,NAMED('DetA'));
