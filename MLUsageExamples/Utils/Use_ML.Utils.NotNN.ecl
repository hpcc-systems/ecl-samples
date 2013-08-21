/*
   The ML.Utils.NotNN function returns a_string with the word_count
   word omitted. If no spaces exists in a_string or word_count
   is greater than the number of words in a_string
   then a_string is returned.

*/

  IMPORT ML;
  s2:='There are three spaces ';
     // Last space is on the very end.
  x2:=ML.Utils.NotNN(s2,2);
  OUTPUT(x2);
  s3:='There are four spaces here';
     // Last space is just before 'here'.
  x3:=ML.Utils.NotNN(s3,6);
  OUTPUT(x3);	
