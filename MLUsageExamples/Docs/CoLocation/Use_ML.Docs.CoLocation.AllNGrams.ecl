/*
   The Docs.Colocation.AllNGrams function uses the words of Words
   to make word ngrams where the maximum words per ngram
   is MaxWordsPerNGram. If Lexicon is given then the ngram
   field of the returned ML.Docs.CoLocation.AllNGramsLayout
   dataset contains a list of integer word_ids instead of the
   text of each word of the ngram.

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

  words_of_dSentences := ML.Docs.Colocation.<emphasis>Words</emphasis>(dSentences);
  OUTPUT(words_of_dSentences,NAMED('words_of_dSentences')); 

  AllNGrams1 := ML.Docs.Colocation.AllNGrams(words_of_dSentences);
  OUTPUT(AllNGrams1,NAMED('AllNGrams1')); 

  lexicon := ML.Docs.CoLocation.lexicon(words_of_dSentences);
  AllNGrams2 := ML.Docs.Colocation.AllNGrams(words_of_dSentences,lexicon);
  OUTPUT(AllNGrams2,NAMED('AllNGrams2')); 
