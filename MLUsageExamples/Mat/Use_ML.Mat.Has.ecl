/*
   The ML.Mat.Has matrix module provides matrix properties for
   input_matrix. These matrix properties are density, dimension,
   columns mean, rows mean, and stats (i.e. number of
   elements, row dimension, and column dimension)

*/

   IMPORT * FROM ML;
   A := DATASET([
   {1,1,1},{1,2,2},{1,3,3},
   {2,1,4},{2,2,5},{2,3,6},
   {3,1,7},{3,2,8},{3,3,9}
   ], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   HasProperties := ML.Mat.Has(A);
   OUTPUT(HasProperties);
     // Matrix properties are given in separate workunit files.
