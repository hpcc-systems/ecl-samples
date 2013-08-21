/*
   The Docs.Colocation.SplitCompare function returns a dataset
   that contains ngrams of NGramsDS that contain 2 or more
   words. Each row of the returned dataset contains 1) an input
   dataset ngram (NG) that contained 2 or more words, 2)
   all other fields of NG's inputted record, 3) one single
   word (W) of NG with its pct and 4) the ngram (RG) created
   by removing W from NG (also RG's pct is in the returned
   dataset) For each ngram (NG) of NGramsDS, the returned dataset
   will have a row for every W/RG pair of NG where both
   W and RG exists in NGramsDS.

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

  AllNGrams := ML.Docs.Colocation.AllNGrams(words_of_dSentences);
  OUTPUT(AllNGrams,NAMED('AllNGrams'));

  NGrams := ML.Docs.Colocation.NGrams(AllNGrams);
  OUTPUT(NGrams,NAMED('NGrams')); 

  SplitCompare := ML.Docs.CoLocation.SplitCompare(NGrams);
  OUTPUT(SplitCompare,NAMED('SplitCompare'));
