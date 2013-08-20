/*
   The Utils.Gini functionmacro calculates the Gini Impurity
   for every pivot/target pair in infile. Gini Impurity is one
   minus the sum of the squares of the probabilities. A probability
   is calculated as follows: 1st, N = the number
   of records with a particular pivot value. 2nd, n_class =
   the number of records having a particular target value given
   a particular pivot value. So, the probability = n_class
   divided by N.

*/

   IMPORT * FROM ML;
   IMPORT * FROM ML.Types;
   sRecord := RECORD
     t_RecordID gid;
     t_FieldNumber class;
   END;
   s_Data := 
     DATASET([
              {1,0},{1,0},{1,0},{1,0},{1,0},
              {2,0},{2,1},{2,0},{2,1},{2,0},
              {3,1},{3,2},{3,3},{3,4},{3,5}
             ],sRecord
     );
   OUTPUT(s_Data,NAMED('s_Data'));
   impurity_g := ML.Utils.Gini(s_Data, gid, class);
   OUTPUT (impurity_g,NAMED('impurity_g'));

   /*
     The dataset is divided in three subdatasets: gid =1, gid =2, gid =3.
     For each subdataset Gini Impurity is calculated based on class value
     the dataset could have more attributes, however they won't affect the 
     result (keeping gid as <emphasis>pivot</emphasis> and class as <emphasis>target</emphasis>).

   gid, totalCount, gini
   1      5         0.0                 
     // only one value for class, PURE
   2      5         0.4799999743700027  
     // 2 class values, one has 40% prob the other 60%, somewhat IMPURE
   3      5         0.7999999858438969  // 5 class values with same probability, maximum IMPURE value                                              
     // (max value increase for higher number of class values)
   */
