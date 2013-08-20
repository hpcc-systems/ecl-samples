/*
   The ML.Mat.Pow function multiplies input_matrix to itself
   raised_to minus one times.

*/

   IMPORT * FROM ML;
   A := DATASET([
                 {1,1,2.0},{1,2,0.0},{1,3,0.0},
                 {2,1,0.0},{2,2,2.0},{2,3,0.0},
                 {3,1,0.0},{3,2,0.0},{3,3,2.0}], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));

   PowA:=ML.Mat.Pow(A,3);//PowA is 3 by 3 diagonal matrix of all 8s.
   OUTPUT(PowA);// Warning PowA may not be in same order as A.
