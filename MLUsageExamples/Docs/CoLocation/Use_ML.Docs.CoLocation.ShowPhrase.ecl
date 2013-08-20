/*
   The Docs.CoLocation.ShowPhrase function uses the lexicon to
   convert the optimized_phrase, i.e. the words of the phrase
   are represented by the word_ids, into a STRING for words,
   where each word_id is replaced with the equivalent word.

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

  market_and_bought := '28 1 11';
  OUTPUT(market_and_bought,NAMED('market_and_bought'));

  words_of_phrase := ML.Docs.CoLocation.ShowPhrase(lexicon_of_dSentences, market_and_bought);
  OUTPUT(words_of_phrase,NAMED('words_of_phrase'));
