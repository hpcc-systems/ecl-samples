/*
   The Closest routine takes a set of distances and returns the
   closest centroid for each entity. The record layout of
   the output is Mat.Types.Element, which is:

     Element := RECORD
       t_Index x;
       t_Index y;
       t_value value;
     END;
   

   where x is an id of an entity, y is the id of the cluster
   centroid closest to x, and value is the distance between
   x and y.

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

  dClosest:=ML.Cluster.Closest(dDistances);
  OUTPUT(SORT(dClosest,y,x),NAMED('dClosest'));
