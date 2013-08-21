/*
   The Docs.Tokenize.Enumerate function takes input_dataset of
   type ML.Docs.Types.Raw and assigns a unique and sequential
   Id to every record of input_dataset.

*/

  IMPORT ML;
  IMPORT ML.Docs.Types;

  dSentences:=DATASET([
  <sp><sp><sp>{1,'David went to the market and bought milk and bread'},
  <sp><sp><sp>{2,'John picked up butter on his way home from work.'},
  <sp><sp><sp>{3,'Jill craved lemon cookies, so she grabbed some at the convenience store'},
  <sp><sp><sp>{4,'Mary needs milk, bread and butter to make breakfast tomorrow morning.'},
  <sp><sp><sp>{5,'William\'s lunch included a sandwich on wheat bread and chocolate chip cookies.'}
  ],ML.Docs.Types.Raw);
  OUTPUT(dSentences,NAMED('dSentences'));

  enum_dSentences := ML.Docs.Tokenize.Enumerate(dSentences);
  OUTPUT(enum_dSentences,NAMED('enum_dSentences'));
