/*
   The Result function returns the locations of the centroids
   after the iterationN iteration.

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
  OUTPUT(ML.Cluster.KMeans(dEntities,dCentroids,30,0.3).Result(2));
     // Compare this result with that of AllResults.
