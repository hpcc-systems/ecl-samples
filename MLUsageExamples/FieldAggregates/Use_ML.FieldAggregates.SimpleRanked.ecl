/*
   The SimpleRanked definition creates a dataset where each numeric
   field is orders ascendingly by value. The returned
   record layout has the same fields as the input dataset,
   plus one more, i.e. the field pos which contains the rank
   of the value of the numeric field.

*/


IMPORT ML;
Chicks := ML.Tests.Deprecated.ChickWeight;
ML.ToField(Chicks,NumericField_Chicks);
SimpleRankedChickWeight2NumericFieldDS := ML.FieldAggregates(NumericField_Chicks).SimpleRanked;
OUTPUT(SimpleRankedChickWeight2NumericFieldDS,NAMED('SimpleRankedChickWeight2NumericFieldDS'));
