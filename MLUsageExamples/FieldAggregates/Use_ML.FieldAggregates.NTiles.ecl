/*
   The Ntiles definition partitions NumericFieldDS into N Ntiles
   where the returned dataset has all the fields of NumericFieldDS
   plus the two fields: pos (a record id) and ntile
   (ntile number) The number of records (R) in each ntile
   will be approximately the same. For a given value (F) of
   the number field, R is approximately the number of records
   for F divided by N.

*/

   IMPORT ML;
   IrisPlants := ML.Tests.Deprecated.IrisPlantDS;
   OUTPUT(COUNT(IrisPlants),NAMED('c_IrisPlants'));
   OUTPUT(IrisPlants,NAMED('IrisPlants'));
   ML.ToField(IrisPlants,NumericField_IrisPlants);
   IrisPlantNTiles:=ML.FieldAggregates(NumericField_IrisPlants).Ntiles(4);
   OUTPUT(COUNT(IrisPlantNTiles),NAMED('c_IrisPlantNTiles'));
   OUTPUT(IrisPlantNTiles,NAMED('IrisPlantNTiles'));
