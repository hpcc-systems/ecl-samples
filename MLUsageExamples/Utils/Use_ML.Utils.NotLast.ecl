/*
   The ML.Utils.NotLast function returns the STRING before the
   last space. If no spaces exists in a_string then blank
   is returned.

*/

  IMPORT ML;
  s2:='There are three spaces ';
     // Last space is on the very end.
  x2:=ML.Utils.NotLast(s2);
  OUTPUT(x2);
  s3:='There are four spaces here';
     // Last space is just before 'here'.
  x3:=ML.Utils.NotLast(s3);
  OUTPUT(x3);	
