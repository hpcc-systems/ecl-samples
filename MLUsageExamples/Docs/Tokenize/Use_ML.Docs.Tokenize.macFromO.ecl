/*
   The Docs.Tokenize.macFromO macro produces outfile which has
   the same record layout as infile. And, it fills textfield
   with the word text (found in the Word field of lexicon)
   of the word whose fixed length unique identifier is idfield.

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

  opt_words := ML.Docs.Tokenize.ToO(words_of_dSentences,lexicon_of_dSentences);
  OUTPUT(opt_words,NAMED('opt_words'));

  opt_words2 := project(opt_words,transform({opt_words, STRING word_text:=''},self := left));
  ML.Docs.Tokenize.macFromO(opt_words2,Word,word_text,lexicon_of_dSentences,opt_words3);
  OUTPUT(sort(opt_words3,Id,pos),NAMED('opt_words3'));
     //Note. Order of opt_words3 may not be the same as opt_words.
