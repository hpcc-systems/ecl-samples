/*
   The Utils.DoubleFac function calculates the product of small_positive_integer
   and all the odd integers less than small_positive_integer
   if small_positive_integer is odd. And,
   it calculates the product of small_positive_integer and
   all even integers less than small_positive_integer if small_positive_integer
   is even.

*/

IMPORT ML;
odd_double_factorial := ML.Utils.DoubleFac(5);
OUTPUT(odd_double_factorial,NAMED('odd_double_factorial'));
     // odd_double_factorial is 15.0
even_double_factorial := ML.Utils.DoubleFac(6);
OUTPUT(even_double_factorial,NAMED('even_double_factorial'));
     // even_double_factorial is 48.0
