/*
   The Docs.PorterStem function uses the Porter stemming algorithm
   to stem lower_case_word. This is the pure ECL version
   of the algorithm and therefore probably slower than the
   C version. See <emphasis role="underline">http://www.tartarus.org/~martin/PorterStemmer</emphasis>

*/

  IMPORT ML;
  stemmed:=ML.Docs.PorterStem('included');
  OUTPUT(stemmed); // stemmed is 'includ'.
