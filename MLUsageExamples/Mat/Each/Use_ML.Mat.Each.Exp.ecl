   The ML.Mat.Each.Exp function returns the natural exponential
   value of each element of input_matrix.

*/

   IMPORT * FROM ML;
   A := DATASET([
   {1,1,2.0},{1,2,2.0},{1,3,2.0},
   {2,1,2.0},{2,2,2.0},{2,3,2.0},
   {3,1,2.0},{3,2,2.0},{3,3,2.0}], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));

   ExpA := ML.Mat.Each.Exp(A);
   OUTPUT(ExpA,NAMED('ExpA'));
   
   /*
    Contents of ExpA  
   x   y   value   
   1   1   7.3891  
   1   2   7.3891  
   1   3   7.3891  
   2   1   7.3891  
   2   2   7.3891  
   2   3   7.3891  
   3   1   7.3891  
   3   2   7.3891  
   3   3   7.3891  
   */
