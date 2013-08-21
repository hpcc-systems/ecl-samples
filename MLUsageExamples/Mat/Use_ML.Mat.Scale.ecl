/*
   The ML.Mat.Scale function multiplies each element of input_matrix
   by scale_factor.

*/

   IMPORT * FROM ML;
   A := DATASET([
                 {1,1,2.0},{1,2,2.0},{1,3,2.0},
                 {2,1,2.0},{2,2,2.0},{2,3,2.0},
                 {3,1,2.0},{3,2,2.0},{3,3,2.0}], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));

   ScaleA := ML.Mat.Scale(A,0.5);//Scale <emphasis>scale_factor</emphasis> is 0.5
   OUTPUT(ScaleA,NAMED('ScaleA'));
   <?dbfo-need height="1.7in" ?>
   /*
    Contents of ScaleA   
   x   y   value  
   1   1     1.0  
   1   2     1.0  
   1   3     1.0  
   2   1     1.0  
   2   2     1.0  
   2   3     1.0  
   3   1     1.0  
   3   2     1.0  
   3   3     1.0  
   */
