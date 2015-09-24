   The ML.Mat.Sub function does a standard matrix subtraction
   of the two matrices, input_matrix1 and input_matrix2.

*/

   IMPORT * FROM ML;
   A := DATASET([
                 {1,1,2.0},{1,2,2.0},{1,3,2.0},
                 {2,1,2.0},{2,2,2.0},{2,3,2.0},
                 {3,1,2.0},{3,2,2.0},{3,3,2.0}], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   B := DATASET([
                 {1,1,1.0},{1,2,2.0},{1,3,3.0},
                 {2,1,1.0},{2,2,2.0},{2,3,3.0},
                 {3,1,1.0},{3,2,2.0},{3,3,3.0}], ML.Mat.Types.Element);
   OUTPUT(B,NAMED('B'));

   SubAB := ML.Mat.Sub(A,B);
   OUTPUT(SubAB,NAMED('SubAB'));
   
   /*
    Contents of SubAB  
   x   y   value  
   1   1     1.0  
   1   2     0.0  
   1   3    -1.0  
   2   1     1.0  
   2   2     0.0  
   2   3    -1.0  
   3   1     1.0  
   3   2     0.0  
   3   3    -1.0  
   */
