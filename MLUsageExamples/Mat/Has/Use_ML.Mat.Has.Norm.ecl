/*
   The ML.Mat.Has.Norm function returns the norm of input_matrix.

*/

   IMPORT * FROM ML;
   A := DATASET([
   {1,1,2},{1,2,2},{1,3,2},
   {2,1,2},{2,2,2},{2,3,2},
   {3,1,2},{3,2,2},{3,3,2}
   ], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   HasNorm := ML.Mat.Has(A).Norm;
   OUTPUT(HasNorm,NAMED('HasNorm'));
     // HasNorm=6.0
