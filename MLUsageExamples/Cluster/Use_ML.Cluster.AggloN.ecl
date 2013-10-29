/*
   The AggloN module produces the output of all of its EXPORTed
   definitions that have no input parameters, i.e. Clusters,
   Dendrogram, and Distances.

*/

  IMPORT ML;
  D:=ML.Tests.Explanatory.ClusterDS;
  OUTPUT(ML.Cluster.AggloN(dEntities,4));
