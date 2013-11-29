/*
   The Docs.PorterStemC function uses the Porter stemming algorithm
   to stem lower_case_word. This is the C version of
   the algorithm and therefore probably faster than the ECL
   version. See <emphasis role="underline">http://www.tartarus.org/~martin/PorterStemmer</emphasis>

*/

  IMPORT ML;
  stemmed:=ML.Docs.PorterStemC('included');
  OUTPUT(stemmed); // stemmed is 'includ'.
