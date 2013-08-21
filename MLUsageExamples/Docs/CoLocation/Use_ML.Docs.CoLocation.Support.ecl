/*
   The Docs.Colocation.Support function for inputted set of ngrams,
   SetOfNGrams, calculates the support for SetOfNGrams
   which is the ratio of the number of documents that contain
   all the items in the set divided by the total document
   count.

*/

  IMPORT ML;
  IMPORT ML.Docs.Types;

  dSentences:=DATASET([
     {1,'David went to the market and bought milk and bread'},
     {2,'John picked up butter on his way home from work.'},
     {3,'Jill craved lemon cookies, so she grabbed some at the convenience store'},
     {4,'Mary needs milk, bread and butter to make breakfast tomorrow morning.'},
     {5,'William\'s lunch included a sandwich on wheat bread and chocolate chip cookies.'}
  ],ML.Docs.Types.Raw);
  OUTPUT(dSentences,NAMED('dSentences'));

  words_of_dSentences := ML.Docs.Colocation.Words(dSentences);
  OUTPUT(words_of_dSentences,NAMED('words_of_dSentences')); 

  dAllNGrams := ML.Docs.Colocation.<emphasis>AllNGrams</emphasis>(words_of_dSentences);
  OUTPUT(dAllNGrams,NAMED('dAllNGrams'));

  Support:=ML.Docs.CoLocation.Support(['MILK','BREAD','BUTTER'],dAllNGrams);
  OUTPUT(Support,NAMED('Support'));
