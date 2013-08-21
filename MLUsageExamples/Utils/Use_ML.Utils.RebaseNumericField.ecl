/*
   The Utils.RebaseNumericField module provides three functions
   that enable one to change the base of input_dataset and
   then return it to the original base. These functions are:
   Mapping, ToNew, and ToOld.

*/

   IMPORT ML;
   value_record := RECORD
    UNSIGNED rid;
    REAL     length;
    INTEGER1 class;
   END;

   d := DATASET([
              {1,1,0}, {2,2,0}, {3,3,0}, {4,4,0}, {5,5,1},
              {6,6,0}, {7,7,1}, {8,8,1}, {9,9,1}, {10,10,1}
             ],value_record
        );
   ML.ToField(d,O);
     //convert to NumericField dataset.

   // Select the dependent and independent variables, respectively.
   Y := O(Number=2); 
     // pull out class
   OUTPUT(Y,NAMED('Y'));

   //For the matrix based implementation of Logistic regression to 
   // work properly, matrix Y has to be a single column matrix (i.e. 1x10).

   //We can achieve that using ML.Utils.RebaseNumericField as so
   RebaseY := ML.Utils.RebaseNumericField(Y);
   Y_Map1 := RebaseY.Mapping(1);
   OUTPUT(Y_Map1,NAMED('Y_Map1'));
   newY := RebaseY.ToNew(Y_Map1);
   OUTPUT(newY,NAMED('newY'));
   oldY := RebaseY.ToNew(Y_Map1);
   OUTPUT(oldY,NAMED('oldY'));
