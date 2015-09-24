   The AppendID macro takes any structured dataset, and appends
   (actually prepends) a unique record identifier column
   to it.

*/


   IMPORT ML;
   Chicks:=ML.Tests.Deprecated.ChickWeight;
   ML.AppendID(Chicks, recID, dOrigWithId); 
     // Because the dataset, Chicks, already has a record id field, dOrigWithId will
     // have two, i.e. rid and recID.
   
   /*
               Output of dOrigWithId             
  recid   rid   weight   time   chick   diet  
      1     1       42      0       1      1  
      2     2       51      2       1      1  
      3     3       59      4       1      1  
      4     4       64      6       1      1  
      .     .        .      .       .      .
   */
