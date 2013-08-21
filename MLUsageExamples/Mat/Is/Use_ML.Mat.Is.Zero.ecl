/*
   The ML.Mat.Is.Zero function returns a true if input_matrix
   is a Zero matrix. Otherwise it returns false.

*/


   IMPORT * FROM ML;
   A := DATASET([
               {1,1,0},{1,2,0},{1,3,0},
               {2,1,0},{2,2,0},{2,3,0},
               {3,1,0},{3,2,0},{3,3,0}
               ], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   /*
    Zero Matrix  
   0   0   0  
   0   0   0  
   0   0   0  
   */

   IsZero := ML.Mat.Is(A).Zero;
   OUTPUT(IsZero,NAMED('IsZero'));
