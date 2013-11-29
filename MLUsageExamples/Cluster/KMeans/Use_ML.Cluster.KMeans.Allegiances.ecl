/*
   The Allegiances() function returns the table of allegiances
   (centroid each entity is closest to) after the iterationN
   iteration. If iterationN is not given then it defaults
   to the last iteration. The layout of Allegiances' output
   is ML.Mat.Types.Element, which is:

     Element := RECORD
       t_Index x;
       t_Index y;
       t_value value;
     END;
   

   where x is an id of an entity, y is the id of the cluster
   x is closest to, and value is the distance x is from y's
   centroid.

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
  //Note. Allegiances' OUTPUT has been sorted first by y then by x. So the
  // reader can easily see what entities are in each cluster.
  OUTPUT(SORT(ML.Cluster.KMeans(dEntities,dCentroids,30,0.3).Allegiances(),y,x));
