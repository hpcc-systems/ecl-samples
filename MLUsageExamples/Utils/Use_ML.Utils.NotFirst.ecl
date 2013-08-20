/*
   The ML.Utils.NotFirst function returns the STRING after the
   1st space. If no spaces exists in a_string then blank is
   returned.

*/

  IMPORT ML;
  s0:='The first has';
  x:=NotFirst(s0); 
     // First space in s0 is before 'first'.
  OUTPUT(x);
  s1:='The_first has';
  x1:=NotFirst(s1); 
     // First space in s1 is before 'has'.
  OUTPUT(x1);
