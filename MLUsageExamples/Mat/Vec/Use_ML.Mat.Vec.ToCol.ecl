/*
   The Vec.ToCol function returns a matrix column which is a
   dataset of type Mat.Types.Element with all y values = column_number.

*/

  IMPORT * FROM ML;
  A := DATASET([
                {1,1,6},{2,1,8},{3,1,1}
               ], ML.Mat.Types.VecElement);
  OUTPUT(A,NAMED('A'));

  M := ML.Mat.Vec.ToCol(A,10);
  OUTPUT(M,NAMED('M'));
  /*
     M's content    
  x   y    value  
  1   10     6.0  
  2   10     8.0  
  3   10     1.0  
  */
