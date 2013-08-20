/*
   The Utils.mac_SequenceInField macro will sequence all records
   having the same infield value. Furthermore, for records
   having the same infield value, seq will reflect their
   relative order in infile (e.g. if record x and y both have
   the same infield value and x was in infile before y then
   x's seq number would be smaller than y's)

*/

    IMPORT ML;
    // x has a ML.Types.NumericField layout but all number fields are zero.
    x:=DATASET([
        {1,0,42.0},
        {1,0,0.0},
        {1,0,1.0},
        {1,0,1.0},
        {2,0,51.0},
        {2,0,2.0},
        {2,0,1.0},
        {2,0,2.0},
        {3,0,59.0},
        {3,0,4.0},
        {3,0,2.0},
        {3,0,1.0},
        {4,0,64.0},
        {4,0,6.0},
        {4,0,2.0},
        {4,0,2.0},
        {5,0,76.0},
        {5,0,8.0},
        {5,0,3.0},
        {5,0,1.0}
    ], ML.Types.NumericField);
    OUTPUT(x,NAMED('x'),all);

    ML.Utils.mac_SequenceInField(x,id,number,NumericFieldChickWeight2);
    OUTPUT(NumericFieldChickWeight2,NAMED('NumericFieldChickWeight2'),all);
