   The ML.Mat.Trans function does a standard matrix transposition
   of input_matrix.

*/

IMPORT ML;
IMPORT ML.Mat AS Mat;
d := DATASET([
              {1,1,1.0},
              {1,2,2.0},
              {2,1,3.0},
              {2,2,4.0},
              {3,1,5.0},
              {3,2,6.0}
             ],Mat.Types.Element);
OUTPUT(d,NAMED('d'));

/*
  Dataset d's Content   
     x   y   value  
     1   1     1.0  
     1   2     2.0  
     2   1     3.0  
     2   2     4.0  
     3   1     5.0  
     3   2     6.0  
*/
Trans_d:=Mat.Trans(d);
OUTPUT(sort(Trans_d,x,y),NAMED('Trans_d'));

/*
      Dataset Trans_d's Content       
             1   1   1.0  
             1   2   3.0  
             1   3   5.0  
             2   1   2.0  
             2   2   4.0  
             2   3   6.0  
*/
