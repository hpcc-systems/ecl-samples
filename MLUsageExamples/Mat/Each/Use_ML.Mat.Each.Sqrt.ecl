   The ML.Mat.Each.Sqrt function takes the square root of each
   element of input_matrix.

*/

   IMPORT * FROM ML;
   A := DATASET([
   {1,1,4.0},{1,2,4.0},{1,3,4.0},
   {2,1,4.0},{2,2,4.0},{2,3,4.0},
   {3,1,4.0},{3,2,4.0},{3,3,4.0}], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));

   SqrtA := ML.Mat.Each.Sqrt(A);
   OUTPUT(SqrtA,NAMED('SqrtA'));
   
   /*
    Contents of SqrtA  
   x   y   value  
   1   1     2.0  
   1   2     2.0  
   1   3     2.0  
   2   1     2.0  
   2   2     2.0  
   2   3     2.0  
   3   1     2.0  
   3   2     2.0  
   3   3     2.0  
   */
