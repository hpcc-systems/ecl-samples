/*
   The Docs.Colocation.Lexicon function takes input_dataset of
   type ML.Docs.Types.WordElement and constructs a lexicon
   dataset of type ML.Docs.Types.LexiconElement.

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

  lexicon_of_dSentences := ML.Docs.Colocation.Lexicon(words_of_dSentences);
  OUTPUT(lexicon_of_dSentences,NAMED('lexicon_of_dSentences'));
