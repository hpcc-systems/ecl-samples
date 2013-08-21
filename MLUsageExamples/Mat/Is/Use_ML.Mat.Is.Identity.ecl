/*
   The ML.Mat.Is.Identity function returns a true if input_matrix
   is a Identity matrix. Otherwise it returns false.

*/


   IMPORT * FROM ML;
   A := DATASET([
               {1,1,1},{1,2,0},{1,3,0},
               {2,1,0},{2,2,1},{2,3,0},
               {3,1,0},{3,2,0},{3,3,1}
               ], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   /*
     Identity Matrix   
     1   0   0  
     0   1   0  
     0   0   1  
   */

   IsIdentity := ML.Mat.Is(A).Identity;
   OUTPUT(IsIdentity,NAMED('IsIdentity'));
