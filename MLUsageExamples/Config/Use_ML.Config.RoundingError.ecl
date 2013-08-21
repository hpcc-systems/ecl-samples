/*
   The ML.Config.RoundingError constant returns the constant,
   0.0000000001, which is the amount that a REAL value can
   be different than zero and still be considered zero. (note.
   This is used by some of the matrix functions)

*/

IMPORT ML;
OUTPUT(ML.Config.RoundingError,NAMED('RoundingError'));
