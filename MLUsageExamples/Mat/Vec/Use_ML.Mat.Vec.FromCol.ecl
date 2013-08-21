/*
   The Vec.FromCol function returns a vector (i.e. a dataset
   of type Types.VecElement) which was the column_number column
   of the input_matrix.

*/

   IMPORT * FROM ML;
   IMPORT ML.Mat.MU;
   A := DATASET([
        {1,1,1},{1,2,2},
        {2,1,3},{2,2,4},
        {3,1,5},{3,2,6}
   ], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));

   V:=ML.Mat.Vec.FromCol(A,2);
   OUTPUT(V);
   /*
      V's content   
  x   y   value  
  1   1     2.0  
  2   1     4.0  
  3   1     6.0  
   */
