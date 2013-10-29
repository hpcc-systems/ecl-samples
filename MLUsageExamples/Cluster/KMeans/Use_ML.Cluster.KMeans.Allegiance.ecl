/*
   The Allegiance function returns the centroid to which entityId
   is closest after iterationN iteration. If iterationN
   is not given then the iteration used is the last one.

*/

  IMPORT ML,ML.Tests.Explanatory;
  D:=ML.Tests.Explanatory.ClusterDS;
  ML.ToField(D,dEntities);
  dCentroidMatrix:=DATASET([
  {1,2,2},
  {2,3,3},
  {3,4,4},
  {4,5,5}
  ],RECORDOF(D));
  ML.ToField(dCentroidMatrix,dCentroids);
  OUTPUT(ML.Cluster.KMeans(dEntities,dCentroids,30,0.3).Allegiance(2));
