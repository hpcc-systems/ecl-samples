/*
   The ML.Mat.Thin function makes input_matrix fully sparse,
   i.e. removes any elements that are zero.

*/

   IMPORT * FROM ML;
   A := DATASET([
                 {1,1,1.0},{1,2,0.0},{1,3,0.0},
                 {2,1,0.0},{2,2,2.0},{2,3,0.0},
                 {3,1,0.0},{3,2,0.0},{3,3,3.0}], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));

   ThinA := ML.Mat.Thin(A);
   OUTPUT(ThinA,NAMED('ThinA'));
   /*
    Contents of ThinA  
   x   y   value  
   1   1     1.0  
   2   2     2.0  
   3   3     3.0  
   */
