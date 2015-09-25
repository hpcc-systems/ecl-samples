   The Vec.RepDiag function replaces elements of the main diagonal
   of input_matrix with elements of input_vector starting
   with vector_index position of input_vector.

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

  M2 := ML.Mat.Vec.RepDiag(M,V,1);
  OUTPUT(M2,NAMED('M2'));
  
  /*
    M2's content   
  x   y   value  
  1   2     2.0  
  1   3     3.0  
  2   1     4.0  
  2   3     6.0  
  3   1     7.0  
  3   2     8.0  
  1   1     6.0  
  2   2     8.0  
  3   3     1.0  
  */
// Note. displayed order of M2 may not be as expected.
