/*
   The Vec.Norm function calculates the norm of input_vector
   which is the square root of its dot product.

*/

  // example1
  IMPORT * FROM ML;
  A := DATASET([
                {1,1,6},{2,1,8},{3,1,1},{4,1,8},{5,1,5},{6,1,9}
               ], ML.Mat.Types.VecElement);
  OUTPUT(A,NAMED('A'));

  A_norm := ML.Mat.Vec.Norm(A);
  OUTPUT(A_norm,NAMED('A_norm'));
     // A_norm=16.46207763315433
