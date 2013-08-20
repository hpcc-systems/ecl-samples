/*
   The ML.Mat.Is.Triangular function returns a true if input_matrix
   is a Triangular matrix. Otherwise it returns false.

*/


   IMPORT * FROM ML;
   A := DATASET([
               {1,1,1},{1,2,0},{1,3,0},
               {2,1,4},{2,2,3},{2,3,0},
               {3,1,5},{3,2,1},{3,3,2}
               ], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   /*
      Triangular Matrix    
       1   0   0  
       4   3   0  
       5   1   2  
   */

   IsTriangular := ML.Mat.Is(A).Triangular;
   OUTPUT(IsTriangular,NAMED('IsTriangular'));
