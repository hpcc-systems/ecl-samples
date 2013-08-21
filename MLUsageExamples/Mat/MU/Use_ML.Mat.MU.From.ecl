/*
   The ML.Mat.MU.From function takes a multi_matrix with record
   layout ML.Types.MUElement and a matrix identifier matrix_id
   and returns all the records of multi_matrix that have
   the identifier matrix_id. These will be all the elements
   of a given matrix.

*/


   IMPORT * FROM ML;
   A1 := DATASET([
                  {1,1,1.0},{1,2,1.0},{1,3,1.0},
                  {2,1,1.0}, {2,2,1.0},{2,3,1.0},
                  {3,1,1.0},{3,2,1.0}, {3,3,1.0}
                 ], ML.Mat.Types.Element);
   OUTPUT(A1,NAMED('A1'));

   A1MU := ML.Mat.MU.To(A1, 4);
   OUTPUT(A1MU,NAMED('A1MU'));

   A2 := DATASET([
                  {1,1,2.0},{1,2,2.0},{1,3,2.0},
                  {2,1,2.0}, {2,2,2.0},{2,3,2.0},
                  {3,1,2.0},{3,2,2.0}, {3,3,2.0}
                 ], ML.Mat.Types.Element);
   OUTPUT(A2,NAMED('A2'));

   A2MU := ML.Mat.MU.To(A2, 7);
   OUTPUT(A2MU,NAMED('A2MU'));

   A1MUPlusA2MU:=A1MU+A2MU;
     // Two matrices in resulting dataset
   OUTPUT(A1MUPlusA2MU,NAMED('A1MUPlusA2MU'));Result is orginal A1MU matrix.
   OUTPUT(A1MU_org,NAMED('A1MU_org'));
