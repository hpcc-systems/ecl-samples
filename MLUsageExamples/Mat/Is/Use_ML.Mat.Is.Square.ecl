/*
   The ML.Mat.Is.Square function returns a true if input_matrix
   is a Square matrix. Otherwise it returns false.

*/


   IMPORT * FROM ML;
   A := DATASET([
               {1,1,1},{1,2,2},{1,3,3},
               {2,1,4},{2,2,5},{2,3,6},
               {3,1,7},{3,2,8},{3,3,9}
               ], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   /*
    Square Matrix  
   1   2   3  
   4   5   6  
   7   8   9  
   */

   IsSquare := ML.Mat.Is(A).Square;
   OUTPUT(IsSquare,NAMED('IsSquare'));
