/*
   The ML.Mat.Mul function does a standard matrix multiply of
   the two matrices, input_matrix1 and input_matrix2.

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

   MulAB := ML.Mat.Mul(A,B);
   OUTPUT(MulAB,NAMED('MulAB'));
   /*
       Contents of MulAB    
      x       y     value    
      1     1       6.0  
      1     2      12.0  
      1     3      18.0  
      2     1       6.0  
      2     2      12.0  
      2     3      18.0  
      3     1       6.0  
      3     2      12.0  
      3     3      18.0       
      Note. The records of MulAB may not be in the order shown here.
    */
