/*
   The ML.Mat.Has.Stats function returns a single record containing
   stats for the input_matrix. The stats returned for
   input_matrix are:

   1. Number of elements in the input_matrix (NElements)

   2. Row dimension (XMax)

   3. Column dimension (YMax)

*/


   IMPORT * FROM ML;
   A := DATASET([
   {1,1,1},{1,2,2},{1,3,3},{1,4,4},
   {2,1,5},{2,2,6},{2,3,7},{2,4,8},
   {3,1,9},{3,2,10},{3,3,11},{3,4,12},
   {4,1,13},{4,2,14},{4,3,15},{4,4,16}
   ], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   /*
   4 X 4 Matrix
    1  2  3  4
    5  6  7  8
    9 10 11 12
   13 14 15 16
   */

   HasStats := ML.Mat.Has(A).Stats;
   OUTPUT(HasStats,NAMED('HasStats'));
