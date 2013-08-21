/*
   The MinMedNext definition creates a dataset where each record
   contains statistics for the values of one of the 'number'
   fields of NumericFieldDS.

*/

   IMPORT ML;
   Chicks := ML.Tests.Deprecated.ChickWeight;
   ML.ToField(Chicks,NumericField_Chicks);
   OUTPUT(ML.FieldAggregates(NumericField_Chicks).MinMedNext);
   <?dbfo-need height="1.0in" ?>
   /*
                               Output of ML.FieldAggregates.MinMedNext                            
  number   median   nextval   minval   maxval   sumval    countval   mean     var       sd     
       1    103.0     104.0     35.0    373.0   70411.0      578.0   121.82   5042.48   71.01  
       2     10.0      12.0      0.0     21.0    6195.0      578.0    10.72     45.60    6.75  
       3     26.0      27.0      1.0     50.0   14884.0      578.0    25.75    211.88   14.56  
       4      2.0       3.0      1.0      4.0    1292.0      578.0     2.24      1.35    1.16  
   */
