   The Vec.ToDiag function makes a diagonal matrix from the input_vector
   starting with element_number element of input_vector.

*/

  // example1
  IMPORT * FROM ML;
  A := DATASET([
                {1,1,6},{2,1,8},{3,1,1},{4,1,8},{5,1,5},{6,1,9}
               ], ML.Mat.Types.VecElement);
  OUTPUT(A,NAMED('A'));

  M1 := ML.Mat.Vec.ToDiag(A);
  OUTPUT(M1,NAMED('M1'));
  
  /*
    M1's content   
  x   y   value  
  1   1     6.0  
  2   2     8.0  
  3   3     1.0  
  4   4     8.0  
  5   5     5.0  
  6   6     9.0  
  */

  // example2
  IMPORT * FROM ML;
  A := DATASET([
                {1,1,6},{2,1,8},{3,1,1},{4,1,8},{5,1,5},{6,1,9}
               ], ML.Mat.Types.VecElement);
  OUTPUT(A,NAMED('A'));

  M2 := ML.Mat.Vec.ToDiag(A,3);
  OUTPUT(M2,NAMED('M2'));
  
  /*
    M2's content   
  x   y   value  
  1   1     1.0  
  2   2     8.0  
  3   3     5.0  
  4   4     9.0  
  */
