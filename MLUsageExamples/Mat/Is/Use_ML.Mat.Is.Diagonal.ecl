/*
   The ML.Mat.Is.Diagonal function returns a true if input_matrix
   is a Diagonal matrix. Otherwise it returns false.

*/


   IMPORT * FROM ML;
   A := DATASET([
               {1,1,3},{1,2,0},{1,3,0},
               {2,1,0},{2,2,2},{2,3,0},
               {3,1,0},{3,2,0},{3,3,6}
               ], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   /*
     Diagonal Matrix   
     3   0   0  
     0   2   0  
     0   0   6  
   */

   IsDiagonal := ML.Mat.Is(A).Diagonal;
   OUTPUT(IsDiagonal,NAMED('IsDiagonal'));
