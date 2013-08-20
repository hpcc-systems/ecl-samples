/*
   The ML.FromField macro is used to reconstitute an original
   matrix from a NumericField-formatted dataset. Basically,
   this means the output_layout contains names of numeric fields
   that correspond to numbers in the input_dataset.

*/


  IMPORT ML;
  // Example 1
  // The following 2 statements are needed for the FromField examples given below.
  Chicks:=ML.Tests.Deprecated.ChickWeight;
  ML.ToField(Chicks,NumericFieldChicks);

  lOrig:=recordof(ML.Tests.Deprecated.ChickWeight);
  ML.FromField(NumericFieldChicks,lOrig,OrigDS); 
     // No mapping given, so assumes input dataset's field numbers also give the order
     // of the corresponding numeric fields of the output. Another way of saying this is
     // that the desired output layout has its UID and numeric fields in the same order
     // as the <indexterm><primary>ToField</primary></indexterm> process's input dataset.
  OUTPUT(OrigDS,NAMED('OrigDS'));
  <?dbfo-need height="1.4in" ?>
  /*
             Output of OrigDS           
  rid   weight   time   chick   diet  
    1       42      0       1      1  
    2       51      2       1      1  
    3       59      4       1      1  
    4       64      6       1      1  
    .        .      .       .      .
    .        .      .       .      .
    .        .      .       .      .
  */

  IMPORT ML;
  // Example 2
  // The following 2 statements are needed for the FromField examples given below.
  Chicks:=ML.Tests.Deprecated.ChickWeight;
  ML.ToField(Chicks,NumericFieldChicks);

  // Record of FromField's output dataset.
  OutSpecialRec := RECORD
    UNSIGNED wgt;
    UNSIGNED Time;
    UNSIGNED chicken;
    UNSIGNED Diet;
    UNSIGNED rid;
  END;

  // Map to map field numbers to appropriate fields in desired output dataset.
  OutSpecialMap:=
     DATASET([
              {'rid','ID'}
              ,{'time','2'}
              ,{'wgt','1'}
              ,{'diet','4'}
              ,{'chicken','3'}
             ],{STRING <emphasis>orig_name</emphasis>;STRING <emphasis>assigned_name</emphasis>;}
     );

  ML.FromField(NumericFieldChicks,OutSpecialRec,CustomizedDS,OutSpecialMap);
  OUTPUT(CustomizedDS,NAMED('CustomizedDS'));
  <?dbfo-need height="1.4in" ?>
  /*
         Output of CustomizedDS        
  wgt   time   chicken   diet   rid  
   42      0         1      1     1  
   51      2         1      1     2  
   59      4         1      1     3  
   64      6         1      1     4  
    .      .         .      .     .
    .      .         .      .     .
    .      .         .      .     .
  */
