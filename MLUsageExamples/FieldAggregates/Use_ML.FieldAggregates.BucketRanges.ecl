/*
   The BucketRanges definition creates a dataset containing each
   buckets minimum and maximum value for each numeric field
   of NumericFieldDS.

*/


IMPORT ML;
IrisPlants := ML.Tests.Deprecated.IrisPlantDS;
OUTPUT(IrisPlants,NAMED('IrisPlants'));
ML.ToField(IrisPlants,NumericField_IrisPlants);
IrisPlantBucketRanges:=ML.FieldAggregates(NumericField_IrisPlants).BucketRanges(4);
OUTPUT(IrisPlantBucketRanges(number!=1),NAMED('IrisPlantBucketRanges'));
     // number!=1 removes records of the 'class' field.

/*
   Output of IrisPlantBucketRanges   
  number   bucket   min   max   cnt  
       2        1   4.3   5.1    41  
       2        2   5.2   6.1    54  
       2        3   6.2   7.0    43  
       2        4   7.1   7.9    12  
       3        1   2.0   2.5    19  
       3        2   2.6   3.1    76  
       3        3   3.2   3.8    49  
       3        4   3.9   4.4     6  
       4        1   1.0   1.9    50  
       4        2   3.0   3.9    11  
       4        3   4.0   5.4    61  
       4        4   5.5   6.9    28  
       5        1   0.1   0.6    50  
       5        2   1.0   1.2    15  
       5        3   1.3   1.8    51  
       5        4   1.9   2.5    34  
*/
