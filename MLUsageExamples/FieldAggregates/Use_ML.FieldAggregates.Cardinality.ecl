/*
   The ML.FieldAggregates.Cardinality definition creates a dataset
   containing the cardinality for each number field. That
   is, the dataset contains the number of unique values
   for each number field.

*/

   IMPORT ML;
   Iris := ML.Tests.Deprecated.IrisPlantDS;
   ML.ToField(Iris,NF_Iris);
   OUTPUT(ML.FieldAggregates(NF_Iris).Cardinality);
   /*
  NF_Iris Cardinality   
  number   cardinality  
       1             3  
       2            35  
       3            23  
       4            43  
       5            22  
   */
