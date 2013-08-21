/*
   The ML.Mat.Each.Add function adds scalar to each element of
   input_matrix.

*/

   IMPORT * FROM ML;
   A := DATASET([
   {1,1,2.0},{1,2,2.0},{1,3,2.0},
   {2,1,2.0},{2,2,2.0},{2,3,2.0},
   {3,1,2.0},{3,2,2.0},{3,3,2.0}], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));

   AddA5 := ML.Mat.Each.Add(A,5);
   OUTPUT(AddA5,NAMED('AddA5'));
   <?dbfo-need height="1.7in" ?>
   /*
    Contents of AddA5  
   x   y   value  
   1   1     7.0  
   1   2     7.0  
   1   3     7.0  
   2   1     7.0  
   2   2     7.0  
   2   3     7.0  
   3   1     7.0  
   3   2     7.0  
   3   3     7.0  
   */
