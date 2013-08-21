/*
   The NTileRanges definition returns a dataset containing the
   value ranges for each ntile created.

*/

   IMPORT ML;
   x20:=DATASET([
             {1,1,3}, {2,1,1}, {3,3,2}, {4,3,1}, {5,3,3},
             {6,6,1}, {7,6,3}, {8,6,1}, {9,9,1}, {10,10,3}
            ],{UNSIGNED rid,UNSIGNED hair,UNSIGNED type}
         );
   ML.ToField(x20,NF_x20);
   OUTPUT(NF_x20,NAMED('NF_x20'));
   OUTPUT(ML.FieldAggregates(NF_x20).NTiles(3));
   OUTPUT(ML.FieldAggregates(NF_x20).NTileRanges(3));
   <?dbfo-need height="1.2in" ?>
   /*
         NTileRanges Output          
  number   ntile   min   max    cnt  
       1       1   1.0    3.0     5  
       1       2   6.0    6.0     3  
       1       3   9.0   10.0     2  
       2       1   1.0    1.0     5  
       2       2   2.0    2.0     1  
       2       3   3.0    3.0     4  
   */
