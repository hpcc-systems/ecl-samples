/*
   The ML.Mat.Is.LowerTriangular function returns a true if input_matrix
   is a LowerTriangular matrix. Otherwise it returns
   false.

*/


   IMPORT * FROM ML;
   A := DATASET([
               {1,1,1},{1,2,0},{1,3,0},
               {2,1,4},{2,2,3},{2,3,0},
               {3,1,5},{3,2,1},{3,3,2}
               ], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   /*
        LowerTriangular Matrix       
           1   0   0  
           4   3   0  
           5   1   2  
   */

   IsLowerTriangular := ML.Mat.Is(A).LowerTriangular;
   OUTPUT(IsLowerTriangular,NAMED('IsLowerTriangular'));
