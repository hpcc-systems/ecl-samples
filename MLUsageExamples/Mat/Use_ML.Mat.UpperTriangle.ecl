/*
   The ML.Mat.UpperTriangle function returns the Upper Triangle
   of input_matrix.

*/

 IMPORT ML;
 IMPORT ML.Mat AS Mat;
 d := DATASET([
               {1,1,1.0},
               {1,2,2.0},
               {1,3,3.0},
               {2,1,4.0},
               {2,2,5.0},
               {2,3,6.0},
               {3,1,7.0},
               {3,2,8.0},
               {3,3,9.0}
              ],Mat.Types.Element);
 OUTPUT(d,NAMED('d'));
 ut:=ML.Mat.UpperTriangle(d);
 OUTPUT(ut,NAMED('ut'));
 /*
   Upper Triangle of D   
     x   y   value  
     1   1     1.0  
     1   2     2.0  
     1   3     3.0  
     2   2     5.0  
     2   3     6.0  
     3   3     9.0  
 */
