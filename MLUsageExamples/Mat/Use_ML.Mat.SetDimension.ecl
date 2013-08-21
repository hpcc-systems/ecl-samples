/*
   The ML.Mat.SetDimension function makes input_matrix a matrix
   with dimensions i_index, j_index if Strict is TRUE. Otherwise
   input_matrix is unchanged.

*/

   IMPORT * FROM ML;
   A := DATASET([
                 {1,1,2.0},{1,2,2.0},{1,3,2.0},
                 {2,1,2.0},{2,2,2.0},{2,3,2.0},
                 {3,1,2.0},{3,2,2.0},{3,3,2.0}], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));

   A2x2 := ML.Mat.SetDimension(A,2,2);
   OUTPUT(A2x2,NAMED('A2x2'));
