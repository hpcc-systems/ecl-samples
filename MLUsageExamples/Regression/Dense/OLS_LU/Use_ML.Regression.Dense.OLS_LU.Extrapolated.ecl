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
    X := O(Number IN [1]); // Pull out the age
    Y := O(Number IN [2]); // Pull out the height
    dense_extrapo_height:=sort(ML.Regression.Dense.OLS_LU(X,Y).Extrapolated(X),id);
    //JOIN Y and dense_extrapo_height to visually compare
    JOIN(Y,dense_extrapo_height,LEFT.id=RIGHT.id
         ,transform({UNSIGNED id,REAL actual,REAL extrapo}
                     ,SELF.id:=LEFT.id
                     ,SELF.actual:=LEFT.value
                     ,SELF.extrapo:=RIGHT.value
          )
    );
    <?dbfo-need height="2.1in" ?>
    /*
             JOIN produces the following:         
  id   actual              extrapo            
   1   76.09999999999999   76.35769230769249  
   2                77.0   76.99265734265749  
   3   78.09999999999999   77.62762237762249  
   4                78.2   78.26258741258749  
   5                78.8    78.8975524475525  
   6                79.7   79.53251748251751  
   7   79.90000000000001   80.16748251748251  
   8   81.09999999999999   80.80244755244752  
   9                81.2   81.43741258741252  
  10                81.8   82.07237762237753  
  11                82.8   82.70734265734254  
  12                83.5   83.34230769230754  
    */
