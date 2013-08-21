/*
   The ML.FieldAggregates.Modes definition creates a dataset
   containing all the modes for each number field. That is,
   the dataset contains all the values for each number field
   that occurs the most.

*/

   IMPORT ML;
   Iris := ML.Tests.Deprecated.IrisPlantDS;
   ML.ToField(Iris,NF_Iris);
   OUTPUT(ML.FieldAggregates(NF_Iris).modes);
   <?dbfo-need height="1.4in" ?>
   /*
     NF_Iris Modes     
  number   mode   cnt  
       1    1.0    50  
       1    2.0    50  
       1    3.0    50  
       2    5.0    10  
       3    3.0    26  
       4    1.5    14  
       5    0.2    28  
   */
