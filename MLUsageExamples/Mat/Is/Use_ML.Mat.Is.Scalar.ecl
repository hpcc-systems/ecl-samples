/*
   The ML.Mat.Is.Scalar function returns a true if input_matrix
   is a Scalar matrix. Otherwise it returns false.

*/


   IMPORT * FROM ML;
   A := DATASET([
               {1,1,6},{1,2,0},{1,3,0},
               {2,1,0},{2,2,6},{2,3,0},
               {3,1,0},{3,2,0},{3,3,6}
               ], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   /*
    Scalar Matrix  
   6   0   0  
   0   6   0  
   0   0   6  
   */

   IsScalar := ML.Mat.Is(A).Scalar;
   OUTPUT(IsScalar,NAMED('IsScalar'));
