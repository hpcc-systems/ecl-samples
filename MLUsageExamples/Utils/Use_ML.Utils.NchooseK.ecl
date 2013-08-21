/*
   The Utils.NchooseK function creates a STRING, S, of positive
   integers from 1 to N. Then it returns a dataset containing
   all substrings of S whose length is K. That is, it returns
   combinations of N number strings taken K at a time.

*/

IMPORT ML;
combinations := ML.Utils.NchooseK(5,3);
OUTPUT(combinations,NAMED('combinations'));
