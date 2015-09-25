   The ML.Mat.Householder.Reflection function produces a dataset
   that is the Householder Reflection (also called a Householder
   matrix or Householder transformation) (named after
   Alston Scott Householder who introduced the transformation
   in 1958) A Householder Reflection is a linear transformation
   that describes a reflection about a plane or hyperplane
   containing the origin.

*/

   IMPORT * FROM ML;
   V :=
      DATASET([
               {1,1,9},
               {2,1,1},
               {3,1,5},
               {4,1,1}
              ], ML.MAT.Types.VecElement);
   OUTPUT(V,NAMED('V'));

   ML.Mat.Householder(V,3).Reflection();
   
   /*
         Householder Reflection of V       
             x   y   value  
             1   1     1.0  
             2   2     1.0  
             3   3    0.98  
             3   4    0.20  
             4   3    0.20  
             4   4   -0.98  
   */
