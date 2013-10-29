/*
   The KMeans module produces the output of all of its EXPORTed
   definitions that have no input parameters, i.e. Allegiances,
   AllResults, Convergence, Delta, DistanceDelta, and
   Result.

*/

  IMPORT ML,ML.Tests.Explanatory;
  D:=ML.Tests.Explanatory.ClusterDS;
  ML.ToField(D,dEntities);
  dCentroidMatrix:=DATASET(
  {1,2,2},
  {2,3,3},
  {3,4,4},
  {4,5,5}
  ,RECORDOF(D));
  ML.ToField(dCentroidMatrix,dCentroids);
  OUTPUT(ML.Cluster.KMeans(dEntities,dCentroids,30,0.3));
