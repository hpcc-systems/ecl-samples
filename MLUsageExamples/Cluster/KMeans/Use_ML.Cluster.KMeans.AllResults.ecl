/*
   The AllResults definition returns a record set with the result
   of all iterations. The output shows how the values of
   each cluster's centroid changes from one iteration to the
   next. This dataset shows the values of each cluster's
   centroid after every iteration. For example, for the dataset
   of entities (DEntities) and the dataset of beginning
   values for the 4 clusters (dCentroids), given in the example
   below, the first value of the centroid for cluster 1
   goes from its initial value of 2.0 to 1.22515 after iteration
   1, to 1.22515 after iteration 2, to 1.22515 after iteration
   3, to 1.848933333333333 after iteration 4, to 1.81355
   after iteration 5, and to 1.81355 after iteration 6.

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
  OUTPUT(ML.Cluster.KMeans(dEntities,dCentroids,30,0.3).AllResults);
