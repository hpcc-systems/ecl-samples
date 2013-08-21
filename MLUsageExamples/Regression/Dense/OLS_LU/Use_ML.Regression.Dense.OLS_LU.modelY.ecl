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
   Reg := ML.Regression.Dense.OLS_LU(age,height);
   my_modelY:=sort(Reg.modelY,id);
     //modelY's returned dataset is sorted because its order isn't guaranteed to be in
     // the same order as X's.
   OUTPUT(my_modelY,NAMED('my_modelY'));
   <?dbfo-need height="2.1in" ?>
   /*
           my_modelY's Content        
  id   number   value              
   1        2   76.35769230769205  
   2        2   76.99265734265714  
   3        2   77.62762237762222  
   4        2   78.26258741258729  
   5        2   78.89755244755237  
   6        2   79.53251748251746  
   7        2   80.16748251748254  
   8        2   80.80244755244762  
   9        2   81.43741258741269  
  10        2   82.07237762237779  
  11        2   82.70734265734286  
  12        2   83.34230769230794  
   */
