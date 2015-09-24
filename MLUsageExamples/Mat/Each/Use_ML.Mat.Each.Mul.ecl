   The ML.Mat.Each.Mul function multiplies each element of input_matrix1
   with the corresponding element of input_matrix2.

*/

   IMPORT * FROM ML;
   A := DATASET([
   {1,1,2.0},{1,2,2.0},{1,3,2.0},
   {2,1,2.0},{2,2,2.0},{2,3,2.0},
   {3,1,2.0},{3,2,2.0},{3,3,2.0}], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   B := DATASET([
   {1,1,3.0},{1,2,3.0},{1,3,3.0},
   {2,1,3.0},{2,2,3.0},{2,3,3.0},
   {3,1,3.0},{3,2,3.0},{3,3,3.0}], ML.Mat.Types.Element);
   OUTPUT(B,NAMED('B'));

   MulAB := ML.Mat.Each.Mul(A,B);
   OUTPUT(MulAB,NAMED('MulAB'));
   
   /*
    Contents of MulAB  
   x   y   value  
   1   1     6.0  
   1   2     6.0  
   1   3     6.0  
   2   1     6.0  
   2   2     6.0  
   2   3     6.0  
   3   1     6.0  
   3   2     6.0  
   3   3     6.0  
   */
