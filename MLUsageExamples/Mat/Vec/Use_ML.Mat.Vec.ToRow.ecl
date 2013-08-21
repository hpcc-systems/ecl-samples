/*
   The Vec.ToRow function returns a matrix row which is a dataset
   of type Mat.Types.Element with all x values = row_number.

*/

  IMPORT * FROM ML;
  A := DATASET([
                {1,1,6},{2,1,8},{3,1,1}
               ], ML.Mat.Types.VecElement);
  OUTPUT(A,NAMED('A'));

  M := ML.Mat.Vec.ToRow(A,10);
  OUTPUT(M,NAMED('M'));
  /*
     M's content    
  x    y   value  
  10   1     6.0  
  10   2     8.0  
  10   3     1.0  
  */
