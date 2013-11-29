/*
   The Clusters definition returns a record with each entity
   and the id of the cluster that the entity was assigned to.
   The record layout of the output is Mat.Types.Element, which
   is:

     Element := RECORD
       t_Index x;
       t_Index y;
       t_value value;
     END;
   

   where x is an id of an entity, y is the id of the cluster
   x is in, and value is always 0 because no centroid is given.

*/

  IMPORT ML;
  D:=ML.Tests.Explanatory.ClusterDS;
  ML.ToField(D,dEntities);
  OUTPUT(ML.Cluster.AggloN(dEntities,4).Clusters);
