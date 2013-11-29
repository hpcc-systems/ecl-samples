/*
   The DistanceDelta function returns the straight-line distance
   traveled by every centroid starting with the BeginN iteration
   through the EndN iteration. Also, DistanceDelta(0)
   returns the same result as DistanceDelta(0,L), where L
   is the last iteration.

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
  OUTPUT(ML.Cluster.KMeans(dEntities,dCentroids,30,0.3).DistanceDelta(0,6));
  /*
   Result of DistanceDelta(0,6)   
          id   value               
           1   0.8072521496564743  
           2    5.611111126185259  
           3    3.850014865483566  
           4    3.290204693024434  
  */
