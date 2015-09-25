   The Medians definition creates a dataset containing the median
   for each numeric field of of the input dataset, i.e.
   NumericFieldDS.

*/


IMPORT ML;
Chicks := ML.Tests.Deprecated.ChickWeight;
ML.ToField(Chicks,NumericField_Chicks);
MediansNumericField_Chicks := ML.FieldAggregates(NumericField_Chicks).Medians;
OUTPUT(MediansNumericField_Chicks,NAMED('MediansNumericField_Chicks'));

/*
         Output of MediansNumericField_Chicks           
                   number   median  
                        3     26.0  
                        4      2.0  
                        1    103.0  
                        2     10.0  
*/
