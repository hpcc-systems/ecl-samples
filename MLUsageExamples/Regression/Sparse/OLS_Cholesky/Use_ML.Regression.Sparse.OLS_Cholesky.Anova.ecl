/*
No description found.
*/

   IMPORT ML;
   value_record := RECORD
   UNSIGNED rid;
   UNSIGNED age;
   REAL height;
   END;
   d := DATASET([{1,18,76.1}, {2,19,77}, {3,20,78.1}
                 ,{4,21,78.2}, {5,22,78.8}, {6,23,79.7}
                 ,{7,24,79.9}, {8,25,81.1}, {9,26,81.2}
                 ,{10,27,81.8},{11,28,82.8}, {12,29,83.5}
                ],value_record);
   ML.ToField(d,o);
   X := O(Number =1); // Pull out the age
   Y := O(Number =2); // Pull out the height
   ML.Regression.sparse.OLS_Cholesky(X,Y).Anova;
   /*
   Output of Anova
    number     2
    model_df   1
    model_ss  57.65
    model_ms  57.65
    model_f  879.99
    error_df  10
    error_ss   0.66
    error_ms   0.066
    total_df   11
    total_ss   58.31
   */
