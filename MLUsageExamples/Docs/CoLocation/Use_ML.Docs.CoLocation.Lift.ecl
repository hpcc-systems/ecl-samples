/*
   The Docs.Colocation.Lift function is the ratio of the Support
   of the two input sets of ngrams, SetOfNGrams1 and SetOfNGrams2,
   compared to the product of the Support of SetOfNGrams1
   and the Support of SetOfNGrams2. More specifically,
   it is the Support(SetOfNGrams1 + SetOfNGrams2) divided
   by Support(SetOfNGrams1) x Support(SetOfNGrams2)

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

  NGramSet1 := ['MILK','BREAD'];
  NGramSet2 := ['BOUGHT'];
  Lift:=ML.Docs.CoLocation.Lift(NGramSet1, NGramSet2,dAllNGrams);
  OUTPUT(Lift,NAMED('Lift'));
