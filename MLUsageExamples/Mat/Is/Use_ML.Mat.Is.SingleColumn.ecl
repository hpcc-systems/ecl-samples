/*
   The ML.Mat.Is.SingleColumn function returns a true if input_matrix
   is a SingleColumn matrix. Otherwise it returns false.

*/


   IMPORT * FROM ML;
   A := DATASET([
               {1,1,1},
               {2,1,4},
               {3,1,5}
               ], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   /*
           SingleColumn Matrix         
                 1  
                 4  
                 5  
   */

   IsSingleColumn := ML.Mat.Is(A).SingleColumn;
   OUTPUT(IsSingleColumn,NAMED('IsSingleColumn'));
