/*
   The Docs.Colocation.MutualInfo function computes a Mutual
   Information (MI) value for each term of in_dataset (except
   those with in_dataset frequency less than min_frequency)
   For each term of in_dataset, the MI value basically compares
   the term's frequency of use in in_dataset with its
   frequency of use in out_dataset. High MI values indicate
   that the term is used more in in_dataset than in out_dataset.
   One possible use of this function is to assist in the
   selection of terms for a specific class, in_dataset, of
   a classification system. For more on the mathematics and
   use of this function see section 13.5.1 of "An Introduction
   to Information Retrieval" by C.D. Manning, et al.

*/

  IMPORT ML;
  IMPORT ML.Docs;

  InClassSentences:=DATASET([
      {1,'David went to the market and bought milk and bread'},
      {2,'John picked up butter on his way home from work.'},
      {3,'Jill craved lemon cookies, so she grabbed some at the convenience store'},
      {4,'Mary needs milk, bread and butter to make breakfast tomorrow morning.'},
      {5,'William\'s lunch included a sandwich on wheat bread and chocolate chip cookies.'}
  ],ML.Docs.Types.Raw);
  OUTPUT(InClassSentences,NAMED('InClassSentences'));

  OutOfClassSentences:=DATASET([
      {1,'Mary said the stock market fluctuates alot.'},
      {2,'When buying stocks, buy low and sell high'},
      {3,'The grass is always greener on the other side'},
      {4,'Mr. Gorbachev, tear down this wall!'},
       {5,'If it doesn\'t fit, you must acquit'}
  ],ML.Docs.Types.Raw);
  OUTPUT(OutOfClassSentences,NAMED('OutOfClassSentences'));

  mi := ML.Docs.CoLocation.MutualInfo(InClassSentences,OutOfClassSentences,2);
  OUTPUT(sort(mi,-mi),NAMED('mi'));
