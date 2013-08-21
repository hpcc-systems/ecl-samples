/*
No description found.
*/

   IMPORT ML;
   value_record := RECORD
   UNSIGNED rid;
   UNSIGNED age;
   REAL height;
   END;
   d := 
     DATASET([
              {1,18,76.1}, 
              {2,19,77}, 
              {3,20,78.1},
              {4,21,78.2},
              {5,22,78.8}, 
              {6,23,79.7},
              {7,24,79.9}, 
              {8,25,81.1}, 
              {9,26,81.2},
              {10,27,81.8},
              {11,28,82.8}, 
              {12,29,83.5}
             ]
             ,value_record
     );
   ML.ToField(d,o);
   age := O(Number IN [1]); // Pull out the age
   OUTPUT(age,NAMED('age'));
   height := O(Number IN [2]); // Pull out the height
   OUTPUT(height,NAMED('height'));
   Reg := ML.Regression.Sparse.OLS_Cholesky(age,height);
   my_RSquared:=Reg.RSquared;// 0.9887639371428346
   OUTPUT(my_RSquared,NAMED('my_RSquared'));
