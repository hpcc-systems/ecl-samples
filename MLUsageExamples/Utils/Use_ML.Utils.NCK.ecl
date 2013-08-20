/*
   The Utils.NCK function finds the number of combinations of
   K elements out of a possible N.

*/

IMPORT ML;
combinations := ML.Utils.NCK(5,2);
OUTPUT(combinations,NAMED('combinations'));
     // combinations is 10.0
