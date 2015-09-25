   The Vec.From function creates a vector, i.e. a dataset of
   type Types.VecElement, given as input a) a vector length
   (vector_length) and b) (optionally) the default value (default_value)
   of each element of the vector (the default value
   is 1.0 if none is given)

*/


 IMPORT ML;
 //example 1
 v1 := ML.Mat.Vec.From(10);

 OUTPUT(v1);
 
 /*
    v1's content   
  x    y   value  
   1   1     1.0  
   2   1     1.0  
   3   1     1.0  
   4   1     1.0  
   5   1     1.0  
   6   1     1.0  
   7   1     1.0  
   8   1     1.0  
   9   1     1.0  
  10   1     1.0  
 */

 IMPORT ML;
 //example 2
 v2 := ML.Mat.Vec.From(10,5.0);

 OUTPUT(v2);
 
 /*
    v2's content   
  x    y   value  
   1   1     5.0  
   2   1     5.0  
   3   1     5.0  
   4   1     5.0  
   5   1     5.0  
   6   1     5.0  
   7   1     5.0  
   8   1     5.0  
   9   1     5.0  
  10   1     5.0  
 */
