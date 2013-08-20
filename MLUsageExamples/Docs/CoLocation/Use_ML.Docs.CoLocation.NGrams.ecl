/*
   The Docs.Colocation.NGrams function produces a dataset of
   type ML.Docs.CoLocation.NGramsLayout which contains one row
   for each ngram of AllNGrams. And, each row contains: 1)
   the ngram, 2) the number of documents for which the ngram
   was found, 3) the percentage that that number is of all
   documents, and

   4) the ngram's inverse document frequency (IDF)

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

  <emphasis>AllNGrams</emphasis> := ML.Docs.Colocation.<emphasis>AllNGrams</emphasis>(words_of_dSentences);
  OUTPUT(<emphasis>AllNGrams</emphasis>,NAMED('<emphasis>AllNGrams</emphasis>')); 

  NGrams := ML.Docs.Colocation.NGrams(<emphasis>AllNGrams</emphasis>);
  OUTPUT(NGrams,NAMED('NGrams')); 
