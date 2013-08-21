/*
   The ML.Mat.Add function does a standard matrix addition of
   the two matrices, input_matrix1 and input_matrix2.

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

   AddAB := ML.Mat.Add(A,B);
   OUTPUT(AddAB,NAMED('AddAB'));
   <?dbfo-need height="1.7in" ?>
   /*
    Contents of AddAB  
   x   y   value  
   1   1     3.0  
   1   2     4.0  
   1   3     5.0  
   2   1     3.0  
   2   2     4.0  
   2   3     5.0  
   3   1     3.0  
   3   2     4.0  
   3   3     5.0  
   */
