/*
   The ML.Mat.Has.Dimension function returns the size of the
   largest dimension of input_matrix.

*/


   IMPORT * FROM ML;
   A := DATASET([
   {1,1,1},{1,2,2},{1,3,3},{1,4,4},
   {2,1,5},{2,2,6},{2,3,7},{2,4,8},
   {3,1,9},{3,2,10},{3,3,11},{3,4,12},
   {4,1,13},{4,2,14},{4,3,15},{4,4,16},
   {5,1,17},{5,2,18},{5,3,19},{5,4,20}
   ], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   /*
   5 X 4 Matrix
    1  2  3  4
    5  6  7  8
    9 10 11 12
   13 14 15 16
   17 18 19 20
   */

   HasDimension := ML.Mat.Has(A).Dimension;
   OUTPUT(HasDimension,NAMED('HasDimension'));
