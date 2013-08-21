/*
   The ML.Mat.Each.Abs function takes the absolute value of each
   element of input_matrix.

*/

   IMPORT * FROM ML;
   A := DATASET([
   {1,1,-2.0},{1,2,-2.0},{1,3,-2.0},
   {2,1,-2.0},{2,2,-2.0},{2,3,-2.0},
   {3,1,-2.0},{3,2,-2.0},{3,3,-2.0}], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));

   AbsA := ML.Mat.Each.Abs(A);
   OUTPUT(AbsA,NAMED('AbsA'));
   <?dbfo-need height="1.7in" ?>
   /*
    Contents of AbsA  
   x   y   value  
   1   1     2.0  
   1   2     2.0  
   1   3     2.0  
   2   1     2.0  
   2   2     2.0  
   2   3     2.0  
   3   1     2.0  
   3   2     2.0  
   3   3     2.0  
   */
