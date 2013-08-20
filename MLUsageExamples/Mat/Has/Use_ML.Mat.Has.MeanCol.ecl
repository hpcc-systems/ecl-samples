/*
   The ML.Mat.Has.MeanCol function returns the mean value of
   each column of input_matrix.

*/

   IMPORT * FROM ML;
   A := DATASET([
   {1,1,1},{1,2,2},{1,3,3},
   {2,1,4},{2,2,5},{2,3,6},
   {3,1,7},{3,2,8},{3,3,9}
   ], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   HasMeanCol := ML.Mat.Has(A).MeanCol;
   OUTPUT(HasMeanCol,NAMED('HasMeanCol'));
   /*
      Content of HasMeanCol    
       x   y   value  
       1   1     4.0  
       1   2     5.0  
       1   3     6.0  
   */
