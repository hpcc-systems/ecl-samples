/*
   The Delta function returns the distance traveled by every
   centroid across each axis starting with the BeginN iteration
   through the EndN iteration. Also, Delta(0) returns the
   same result as Delta(0,L), where L is the last iteration.

*/

  IMPORT ML;
  D:=ML.Tests.Explanatory.ClusterDS;
  ML.ToField(D,dEntities);
  dCentroidMatrix:=DATASET([
  {1,2,2},
  {2,3,3},
  {3,4,4},
  {4,5,5}
  ],RECORDOF(D));
  ML.ToField(dCentroidMatrix,dCentroids);
  OUTPUT(ML.Cluster.KMeans(dEntities,dCentroids,30,0.3).Delta(0,6));
     //Results same as Delta(0).
