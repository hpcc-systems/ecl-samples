/*
   The ML.FieldAggregates.RankedInput definition creates a dataset
   containing NumericFieldDS sorted by number and value
   with position(pos) added. Plus, for records having the
   same number/value pair the position (pos) is the average
   position of all records with the same number/value pair.
   For example, if after sorting the same number/value pair
   are in records 6, 7,

   8, and 9 then pos=(6+7+8+9)/3=7.5.

*/

   IMPORT ML;
   Iris := ML.Tests.Deprecated.IrisPlantDS;
   ML.ToField(Iris,NF_Iris);
   OUTPUT(ML.FieldAggregates(NF_Iris).RankedInput);
