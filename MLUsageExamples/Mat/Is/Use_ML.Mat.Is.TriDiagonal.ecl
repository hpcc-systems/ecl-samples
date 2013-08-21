/*
   The ML.Mat.Is.TriDiagonal function returns a true if input_matrix
   is a TriDiagonal matrix. Otherwise it returns false.

*/


   IMPORT * FROM ML;
   A := DATASET([
               {1,1,1},{1,2,4},{1,3,0},{1,4,0},
               {2,1,3},{2,2,4},{2,3,1},{2,4,0},
               {3,1,0},{3,2,2},{3,3,3},{3,4,4},
               {4,1,0},{4,2,0},{4,3,1},{4,4,3}
               ], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   /*
    TriDiagonal Matrix   
   1   4   0   0  
   3   4   1   0  
   0   2   3   4  
   0   0   1   3  
   */

   IsTriDiagonal := ML.Mat.Is(A).TriDiagonal;
   OUTPUT(IsTriDiagonal,NAMED('IsTriDiagonal'));
