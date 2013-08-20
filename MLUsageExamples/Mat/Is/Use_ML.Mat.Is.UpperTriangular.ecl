/*
   The ML.Mat.Is.UpperTriangular function returns a true if input_matrix
   is a UpperTriangular matrix. Otherwise it returns
   false.

*/


   IMPORT * FROM ML;
   A := DATASET([
               {1,1,1},{1,2,2},{1,3,3},
               {2,1,0},{2,2,1},{2,3,4},
               {3,1,0},{3,2,0},{3,3,5}
               ], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   /*
        UpperTriangular Matrix       
           1   2   3  
           0   1   4  
           0   0   5  
   */

   IsUpperTriangular := ML.Mat.Is(A).UpperTriangular;
   OUTPUT(IsUpperTriangular,NAMED('IsUpperTriangular'));
