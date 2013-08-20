/*
   The Docs.Colocation.Words function takes input_dataset of
   type ML.Docs.Types.Raw and splits the txt field into words
   and places them into records of type ML.Docs.Types.WordElement,
   but before doing the split, it cleans the txt field
   using ML.Docs.Tokenize.Clean.

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
