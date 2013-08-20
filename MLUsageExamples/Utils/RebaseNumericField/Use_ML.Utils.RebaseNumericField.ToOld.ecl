/*
   The Utils.RebaseNumericField.ToOld changes the base of newbase_dataset
   using mapping back to the original base.

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

   Y_Map1 := ML.Utils.RebaseNumericField(Y).Mapping(1);
   OUTPUT(Y_Map1,NAMED('Y_Map1'));
   newY := ML.Utils.RebaseNumericField(Y).ToNew(Y_Map1);
   OUTPUT(newY,NAMED('newY'));
   oldY := ML.Utils.RebaseNumericField(Y).ToOld(newY,Y_Map1);
   OUTPUT(oldY,NAMED('oldY'));
