/*
   The ML.Mat.Inv function returns the standard matrix inverse
   of input_matrix.

*/

   IMPORT * FROM ML;
   A := DATASET([
                 {1,1,1.0},{1,2,0.0},{1,3,0.0},
                 {2,1,0.0},{2,2,2.0},{2,3,0.0},
                 {3,1,0.0},{3,2,0.0},{3,3,3.0}], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));

   InvA := ML.Mat.Inv(A);//Result is the diagonal matrix: 1, 0.5, 0.33333 
   OUTPUT(InvA,NAMED('InvA'));
