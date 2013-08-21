/*
   The ML.Mat.Substitute function constructs a matrix that contains
   all existing elements of input_matrix2 and where input_matrix2
   has NULL elements, input_matrix1 elements are
   inserted.

*/

   IMPORT * FROM ML;
   A := DATASET([
                 {1,1,8.0},{1,2,8.0},{1,3,8.0},
                 {2,1,4.0},{2,2,4.0},{2,3,4.0},
                 {3,1,6.0},{3,2,6.0},{3,3,6.0}], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   B := DATASET([
                 {1,1,1.0},/*1,2 NULL*/{1,3,3.0},
                 {2,1,1.0},{2,2,2.0},{2,3,3.0},
                 {3,1,1.0},{3,2,2.0},{3,3,0.0}], ML.Mat.Types.Element);
   OUTPUT(B,NAMED('B'));

   SubstituteAB := ML.Mat.Substitute(A,B);
   OUTPUT(SubstituteAB,NAMED('SubstituteAB'));
