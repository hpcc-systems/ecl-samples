/*
   The ML.Mat.Is.Symmetric function returns a true if input_matrix
   is a Symmetric matrix. Otherwise it returns false.

*/


   IMPORT * FROM ML;
   A := DATASET([
               {1,1,1},{1,2,7},{1,3,3},
               {2,1,7},{2,2,4},{2,3,-5},
               {3,1,3},{3,2,-5},{3,3,6}
               ], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   /*
    Symmetric Matrix   
   1    7    3  
   7    4   -5  
   3   -5    6  
   */

   IsSymmetric := ML.Mat.Is(A).Symmetric;
   OUTPUT(IsSymmetric,NAMED('IsSymmetric'));
