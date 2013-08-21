/*
   The Vec.Length function returns the length of input_vector.

*/

   IMPORT * FROM ML;
   v := DATASET([{1,1,0},{2,1,0},{3,1,5} ], ML.Mat.Types.VecElement);

   y:=ML.Mat.Vec.Length(v);
   OUTPUT(y);// y is 3
