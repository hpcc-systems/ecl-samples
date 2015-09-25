   The Vec.ToLowerDiag function fills in the Lower diagonal of
   a matrix starting with input_vector's Nth element where
   N is element_number.

*/

  // example1
  IMPORT * FROM ML;
  A := DATASET([
                {1,1,6},{2,1,8},{3,1,1},{4,1,8},{5,1,5},{6,1,9}
               ], ML.Mat.Types.VecElement);
  OUTPUT(A,NAMED('A'));

  M1 := ML.Mat.Vec.ToLowerDiag(A);
  OUTPUT(M1,NAMED('M1'));
  
  /*
    M1's content   
  x   y   value  
  2   1     6.0  
  3   2     8.0  
  4   3     1.0  
  5   4     8.0  
  6   5     5.0  
  7   6     9.0  
  */

  // example2
  IMPORT * FROM ML;
  A := DATASET([
                {1,1,6},{2,1,8},{3,1,1},{4,1,8},{5,1,5},{6,1,9}
               ], ML.Mat.Types.VecElement);
  OUTPUT(A,NAMED('A'));

  M2 := ML.Mat.Vec.ToLowerDiag(A,2);
  OUTPUT(M2,NAMED('M2'));
  
  /*
    M2's content   
  x   y   value  
  2   1     8.0  
  3   2     1.0  
  4   3     8.0  
  5   4     5.0  
  6   5     9.0  
  */
