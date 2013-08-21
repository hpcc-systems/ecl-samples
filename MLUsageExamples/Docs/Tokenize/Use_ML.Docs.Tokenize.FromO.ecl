/*
   The Docs.Tokenize.FromO function does the opposite of ML.Docs.Tokenize.ToO.
   It takes input_dataset1 of type ML.Docs.Types.OWordElement
   and input_dataset2 of type ML.Docs.Types.LexiconElement
   and produces a dataset of type ML.Docs.Types.WordElement.

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

  cleaned_dSentences := ML.Docs.Tokenize.Clean(dSentences);
  OUTPUT(cleaned_dSentences,NAMED('cleaned_dSentences'));

  words_of_dSentences := ML.Docs.Tokenize.Split(cleaned_dSentences);
  OUTPUT(words_of_dSentences,NAMED('words_of_dSentences'));

  lexicon_of_dSentences := ML.Docs.Tokenize.Lexicon(words_of_dSentences);
  OUTPUT(lexicon_of_dSentences,NAMED('lexicon_of_dSentences'));

  optimized_wordDS := ML.Docs.Tokenize.ToO(words_of_dSentences,lexicon_of_dSentences);
  OUTPUT(optimized_wordDS,NAMED('optimized_wordDS'));

  words_of_dSentences2 := ML.Docs.Tokenize.FromO(optimized_wordDS,lexicon_of_dSentences);
  OUTPUT(sort(words_of_dSentences2,Id,pos),NAMED('words_of_dSentences2'));
     //Note. Order of words_of_dSentences2 may not be the same as
     // optimized_wordDS.
