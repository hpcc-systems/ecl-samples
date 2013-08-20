/*
   The Docs.Tokenize.ToO function takes input_dataset1 of type
   ML.Docs.Types.WordElement and input_dataset2 of type ML.Docs.Types.LexiconElement
   and produces an optimized version
   of input_dataset1 where each variable-length word of
   input_dataset1 is replaced with its unique fixed length word
   Id, found in the lexicon, input_dataset2.

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

  opt_words_of_dSentences := ML.Docs.Tokenize.ToO(words_of_dSentences,lexicon_of_dSentences);
  OUTPUT(opt_words_of_dSentences,NAMED('opt_words_of_dSentences'));
