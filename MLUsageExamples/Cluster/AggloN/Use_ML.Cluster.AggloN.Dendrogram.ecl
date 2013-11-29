/*
   The Dendrogram definition displays the result of the clustering
   as a STRING representation of the tree diagram.

*/

  IMPORT ML;
  D:=ML.Tests.Explanatory.ClusterDS;
  OUTPUT(ML.Cluster.AggloN(dEntities,4).Dendrogram);
  <?dbfo-need height="1.1in" ?>
  /*
    Dendrogram After 4 Iterations   
  clusterid   members                          
  3           {3}{8}                           
  6           {6}{{14}{18}}                    
  7           {7}{13}                          
  9           9                                
  17          17                               
  1           {{{{1}{20}}{10}}{4}}{2}          
  5           {{{{5}{11}}{12}}{15}}{{16}{19}}  
  */
