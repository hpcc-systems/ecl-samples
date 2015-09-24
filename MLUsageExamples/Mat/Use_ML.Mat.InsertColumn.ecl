   The ML.Mat.InsertColumn function inserts column column_i into
   input_matrix and the new column is filled with fill_value.

*/

   IMPORT * FROM ML;
   A := DATASET([
                 {1,1,2.0},{1,2,6.0},{1,3,2.0},
                 {2,1,5.0},{2,2,2.0},{2,3,2.0},
                 {3,1,2.0},{3,2,2.0},{3,3,2.0}], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));

   AddColumnA:=ML.Mat.InsertColumn(A,1,9);
   OUTPUT(AddColumnA);
   
   /*
      Contents of AddColumnA     
       x   y   value  
       1   1     9.0  
       2   1     9.0  
       3   1     9.0  
       1   2     2.0  
       1   3     6.0  
       1   4     2.0  
       2   2     5.0  
       2   3     2.0  
       2   4     2.0  
       3   2     2.0  
       3   3     2.0  
       3   4     2.0  
   */
