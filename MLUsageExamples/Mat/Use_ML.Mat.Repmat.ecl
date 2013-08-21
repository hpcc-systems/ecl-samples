/*
   The ML.Mat.Repmat function constructs a matrix consisting
   of M-by-N tiling copies of input_matrix.

*/

   IMPORT * FROM ML;
   A := DATASET([
                 {1,1,2.0},{1,2,0.0},{1,3,0.0},
                 {2,1,0.0},{2,2,2.0},{2,3,0.0},
                 {3,1,0.0},{3,2,0.0},{3,3,2.0}], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));

   Repmat2x3A:=ML.Mat.Repmat(A,2,3);
   OUTPUT(Repmat2x3A);
