/*
   The ML.Mat.Eq function determines if input_matrix1 and input_matrix2
   are equal.

*/

   IMPORT * FROM ML;
   A := DATASET([
                 {1,1,2.0},{1,2,2.0},{1,3,2.0},
                 {2,1,2.0},{2,2,2.0},{2,3,2.0},
                 {3,1,2.0},{3,2,2.0},{3,3,2.0}], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   B := DATASET([
                 {1,1,1.0},{1,2,2.0},{1,3,3.0},
                 {2,1,1.0},{2,2,2.0},{2,3,3.0},
                 {3,1,1.0},{3,2,2.0},{3,3,3.0}], ML.Mat.Types.Element);
   OUTPUT(B,NAMED('B'));

   EqAB := ML.Mat.Eq(A,B);
   OUTPUT(EqAB,NAMED('EqAB'));

   EqAA := ML.Mat.Eq(A,A);
   OUTPUT(EqAA,NAMED('EqAA'));
