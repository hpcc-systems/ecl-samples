/*
   The Utils.Fat function inserts real_number where no value
   exists in input_dataset, i.e. input_dataset is a sparse matrix.

*/

   IMPORT * FROM ML;
   A := DATASET([
                 {1,2,2},{1,3,3},
                 {2,1,4},{2,2,5},{2,3,6},
                 {3,1,7},{3,2,8},{3,3,9}
                ], ML.Types.NumericField);
   OUTPUT(A,NAMED('A'));
   /*
   The A Matrix (3x3)
    0  2  3
    4  5  6
    7  8  9

    Also, note. A is missing zero valued element (1,1). So, it is a sparse matrix.
   */

   B:=ML.Utils.Fat(A,555);
   OUTPUT(B,NAMED('B'));
