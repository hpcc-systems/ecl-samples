   The Simple definition creates a dataset where each record
   contains statistics for one of the numeric fields of NumericFieldDS.

*/


   IMPORT ML;
   Chicks := ML.Tests.Deprecated.ChickWeight;
   ML.ToField(Chicks,NumericField_Chicks);
   Simple_ChicksStatistics:=ML.FieldAggregates(NumericField_Chicks).Simple;
   OUTPUT(Simple_ChicksStatistics);
   
   /*
                        Output of Simple_ChicksStatistics                     
  number   Minval   Maxval   Sumval   Countval   Mean     Var       sd     
       3        1       50    14884        578    25.75    211.88   14.56  
       4        1        4     1292        578     2.24      1.35    1.16  
       1       35      373    70411        578   121.82   5042.48   71.01  
       2        0       21     6195        578    10.72     45.60    6.75  
   */
