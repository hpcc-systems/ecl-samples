/*
   The Docs.Colocation.SubGrams function returns a dataset whose
   record layout contains all the fields of NGramsDS plus
   a new REAL valued field called components The field, components,
   contains the product of the pcts of each word that
   makes up each ngram (NG)

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

  SubGrams := ML.Docs.CoLocation.SubGrams(NGrams);
  OUTPUT(SubGrams,NAMED('SubGrams'));
