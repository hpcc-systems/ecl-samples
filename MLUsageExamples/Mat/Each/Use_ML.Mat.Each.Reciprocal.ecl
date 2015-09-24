   The ML.Mat.Each.Reciprocal function calculates the reciprocal
   of each element of input_matrix, where the numerator
   (top number) of the reciprocal is scalar.

*/

   IMPORT * FROM ML;
   A := DATASET([
   {1,1,2.0},{1,2,2.0},{1,3,2.0},
   {2,1,2.0},{2,2,2.0},{2,3,2.0},
   {3,1,2.0},{3,2,2.0},{3,3,2.0}], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));

   ReciprocalA1 := ML.Mat.Each.Reciprocal(A,1);
   OUTPUT(ReciprocalA1,NAMED('ReciprocalA1'));
   
   /*
       Contents of ReciprocalA1      
         x   y   value  
         1   1     0.5  
         1   2     0.5  
         1   3     0.5  
         2   1     0.5  
         2   2     0.5  
         2   3     0.5  
         3   1     0.5  
         3   2     0.5  
         3   3     0.5  
   */
