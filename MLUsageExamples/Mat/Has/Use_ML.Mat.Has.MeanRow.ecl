/*
   The ML.Mat.Has.MeanRow function returns the mean value of
   each row of input_matrix.

*/

   IMPORT * FROM ML;
   A := DATASET([
   {1,1,1},{1,2,2},{1,3,3},
   {2,1,4},{2,2,5},{2,3,6},
   {3,1,7},{3,2,8},{3,3,9}
   ], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   HasMeanRow := ML.Mat.Has(A).MeanRow;
   OUTPUT(HasMeanRow,NAMED('HasMeanRow'));
   /*
      Content of HasMeanRow    
       x   y   value  
       1   1     2.0  
       1   2     5.0  
       1   3     8.0  
   */
