/*
   The Distances function computes the distance between all j
   and k entities, where j is an entity in entityset1 and k
   is an entity in entityset2, EXCEPT for entities where j=k.
   The distance function used is the one given as algorithm.
   The record layout of the output is Mat.Types.Element,
   which is:

     Element := RECORD
       t_Index x;
       t_Index y;
       t_value value;
     END;
   

   where x is an id of an entity, y is the id of a cluster centroid,
   and value is the distance between x and y.

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
  AllResults:=ML.Cluster.KMeans(dEntities,dCentroids,30,0.3).AllResults;
  ConvergeIteration:=ML.Cluster.KMeans(dEntities,dCentroids,30,0.3).Convergence;
  FinalCentroids:=ML.Cluster.KMeans(dEntities,dCentroids,30,0.3).Result(ConvergeIteration);

  dDistances:=ML.Cluster.Distances(dEntities,FinalCentroids);
  OUTPUT(dDistances,NAMED('dDistances'));
