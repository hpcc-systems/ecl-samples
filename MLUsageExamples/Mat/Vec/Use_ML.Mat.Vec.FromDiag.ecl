/*
   The Vec.FromDiag function returns a vector (i.e. a dataset
   of type Types.VecElement) formed from the elements of the
   Kth diagonal of input_matrix. For example, K=0 returns
   the main diagonal, i.e. all elements of input_matrix where
   x=y.

*/

  // example1
  IMPORT * FROM ML;
  A := DATASET([
   {1,1,1},{1,2,2},{1,3,3},{1,4,4},
   {2,1,5},{2,2,6},{2,3,7},{2,4,8},
   {3,1,9},{3,2,10},{3,3,11},{3,4,12},
   {4,1,13},{4,2,14},{4,3,15},{4,4,16},
   {5,1,17},{5,2,18},{5,3,19},{5,4,20}
   ], ML.Mat.Types.Element);
  OUTPUT(A,NAMED('A'));

  D := ML.Mat.Vec.FromDiag(A);
  OUTPUT(D,NAMED('D'));
  <?dbfo-need height="1.0in" ?>
  /*
     D's content   
  x   y   value  
  1   1     1.0  
  2   1     6.0  
  3   1    11.0  
  4   1    16.0  
  */

  // example2
  IMPORT * FROM ML;
  A2 := DATASET([
   {1,1,1},{1,2,2},{1,3,3},{1,4,4},
   {2,1,5},{2,2,6},{2,3,7},{2,4,8},
   {3,1,9},{3,2,10},{3,3,11},{3,4,12},
   {4,1,13},{4,2,14},{4,3,15},{4,4,16},
   {5,1,17},{5,2,18},{5,3,19},{5,4,20}
   ], ML.Mat.Types.Element);
  OUTPUT(A2,NAMED('A2'));

  D2 := ML.Mat.Vec.FromDiag(A2,1);
  OUTPUT(D2,NAMED('D2'));
  <?dbfo-need height="1.0in" ?>
  /*
    D2's content   
  x   y   value  
  1   1     1.0  
  2   1     6.0  
  3   1    11.0  
  4   1    16.0  
  */
