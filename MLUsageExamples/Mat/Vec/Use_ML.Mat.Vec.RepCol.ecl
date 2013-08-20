/*
   The Vec.RepCol function replaces the column_number column
   of input_matrix with input_vector.

*/

  IMPORT * FROM ML;
  M := DATASET([
       {1,1,1},{1,2,2},{1,3,3},
       {2,1,4},{2,2,5},{2,3,6},
       {3,1,7},{3,2,8},{3,3,9}
  ], ML.Mat.Types.Element);
  OUTPUT(M,NAMED('M'));

  V := DATASET([
                {1,1,6},{2,1,8},{3,1,1}
               ], ML.Mat.Types.VecElement);
  OUTPUT(V,NAMED('V'));

  M2 := ML.Mat.Vec.RepCol(M,V,3);
  OUTPUT(M2,NAMED('M2'));
  <?dbfo-need height="1.7in" ?>
  /*
    M2's content   
  x   y   value  
  1   1     1.0  
  1   2     2.0  
  2   1     4.0  
  2   2     5.0  
  3   1     7.0  
  3   2     8.0  
  1   3     6.0  
  2   3     8.0  
  3   3     1.0  
  */
// Note. displayed order of M2 may not be as expected.
