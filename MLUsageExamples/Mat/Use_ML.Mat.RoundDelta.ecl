/*
   The ML.Mat.RoundDelta function rounds a value, V, of input_matrix
   if the difference between V and ROUND(V) is less
   than delta. Otherwise there is no change in V.

*/

   IMPORT * FROM ML;
   A := DATASET([
                 {1,1,1.1},{1,2,2.0},{1,3,3.0},
                 {2,1,1.0},{2,2,2.1},{2,3,3.0},
                 {3,1,1.1},{3,2,2.0},{3,3,3.0}], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));

   RoundDeltaA := ML.Mat.RoundDelta(A,0.2);
   OUTPUT(RoundDeltaA,NAMED('RoundDeltaA'));
   <?dbfo-need height="1.7in" ?>
   /*
       Contents of RoundDeltaA     
         x   y   value  
         1   1     1.0  
         1   2     2.0  
         1   3     3.0  
         2   1     1.0  
         2   2     2.0  
         2   3     3.0  
         3   1     1.0  
         3   2     2.0  
         3   3     3.0  
   */
