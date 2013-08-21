/*
   The Vec.ToUpperDiag function fills in the upper diagonal of
   a matrix starting with input_vector's Nth element where
   N is element_number.

*/

  // example1
  IMPORT * FROM ML;
  A := DATASET([
                {1,1,6},{2,1,8},{3,1,1},{4,1,8},{5,1,5},{6,1,9}
               ], ML.Mat.Types.VecElement);
  OUTPUT(A,NAMED('A'));

  M1 := ML.Mat.Vec.ToUpperDiag(A);
  OUTPUT(M1,NAMED('M1'));
  <?dbfo-need height="1.2in" ?>
  /*
    M1's content   
  x   y   value  
  1   2     6.0  
  2   3     8.0  
  3   4     1.0  
  4   5     8.0  
  5   6     5.0  
  6   7     9.0  
  */

  // example2
  IMPORT * FROM ML;
  A := DATASET([
                {1,1,6},{2,1,8},{3,1,1},{4,1,8},{5,1,5},{6,1,9}
               ], ML.Mat.Types.VecElement);
  OUTPUT(A,NAMED('A'));

  M2 := ML.Mat.Vec.ToUpperDiag(A,2);
  OUTPUT(M2,NAMED('M2'));
  <?dbfo-need height="1.1in" ?>
  /*
    M2's content   
  x   y   value  
  1   2     8.0  
  2   3     1.0  
  3   4     8.0  
  4   5     5.0  
  5   6     9.0  
  */
