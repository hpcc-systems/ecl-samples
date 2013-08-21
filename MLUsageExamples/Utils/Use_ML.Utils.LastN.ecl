/*
   The ML.Utils.LastN function returns the last word in a_string.

*/

  IMPORT ML;
  s2:='There are three spaces ';
  x2:=ML.Utils.LastN(s2);
  OUTPUT(x2);
  s3:='There are four spaces here';
  x3:=ML.Utils.LastN(s3);
  OUTPUT(x3);	
