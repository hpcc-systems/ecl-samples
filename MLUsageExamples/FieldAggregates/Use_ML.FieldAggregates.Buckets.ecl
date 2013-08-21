/*
   The Buckets definition partitions NumericFieldDS into NBuckets
   buckets where the returned dataset has all the fields
   of NumericFieldDS plus the two fields: pos (a record id)
   and bucket (bucket number) Buckets are created by dividing
   the range of all values of a given number into NBuckets
   parts where each bucket has its own range of values. So,
   a value (V) is placed in the bucket whose range V is between.

*/

   IMPORT ML;
   IrisPlants := ML.Tests.Deprecated.IrisPlantDS;
   OUTPUT(COUNT(IrisPlants),NAMED('c_IrisPlants'));
   OUTPUT(IrisPlants,NAMED('IrisPlants'));
   ML.ToField(IrisPlants,NumericField_IrisPlants);
   IrisPlantBuckets:=ML.FieldAggregates(NumericField_IrisPlants).Buckets(4);
   OUTPUT(COUNT(IrisPlantBuckets),NAMED('c_IrisPlantBuckets'));
   OUTPUT(IrisPlantBuckets,NAMED('IrisPlantBuckets'));
