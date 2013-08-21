/*
   The Vec.Dot function returns the dot product of input_vector1
   and input_vector2. The dot product of two vectors is
   the sum of all the products of elements of the two vectors
   with the same index.

*/

  // example1
  IMPORT * FROM ML;
  A := DATASET([
                {1,1,6},{2,1,8},{3,1,1}
               ], ML.Mat.Types.VecElement);
  OUTPUT(A,NAMED('A'));

  x := ML.Mat.Vec.Dot(A,A);
  OUTPUT(x,NAMED('x'));
     // x = 101.0
// example2
IMPORT * FROM ML;
A := DATASET([
{1,1,6},{2,1,8},{3,1,1}
], ML.Mat.Types.VecElement);
OUTPUT(A,NAMED('A'));

B := DATASET([
{1,1,3},{2,1,4},{3,1,5}
], ML.Mat.Types.VecElement);
OUTPUT(B,NAMED('B'));

x2 := ML.Mat.Vec.Dot(A,B);
OUTPUT(x2,NAMED('x2'));
     // x2 = 55.0
