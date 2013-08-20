/*
No description found.
*/

   IMPORT * FROM ML;
   A := DATASET([
   {1,1,1},{1,2,2},{1,3,3},
   {2,1,4},{2,2,5},{2,3,6},
   {3,1,7},{3,2,8},{3,3,9}
   ], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));
   IsProperties := ML.Mat.Is(A);
   OUTPUT(IsProperties);
     // Matrix types are given in separate workunit files.
