/*
   The Distances definition returns a record set of the distances
   between the clusters produced after niterations iterations.

*/

  IMPORT ML;
  D:=ML.Tests.Explanatory.ClusterDS;
  ML.ToField(D,dEntities);
  OUTPUT(ML.Cluster.AggloN(dEntities,4).Distances);
