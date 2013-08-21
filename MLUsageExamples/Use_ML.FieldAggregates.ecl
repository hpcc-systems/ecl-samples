/*
   The ML.FieldAggregates module produces the output of all of
   its EXPORTed definitions that have no input parameters,
   i.e. Cardinality, Medians, MinNedNext, Modes, RankedInput,
   Simple, and SimpleRanked.

*/

   IMPORT ML;
   Chicks := ML.Tests.Deprecated.ChickWeight;
   ML.ToField(Chicks,NumericField_Chicks);
   OUTPUT(ML.FieldAggregates(NumericField_Chicks));
