/*
   The Associate.EclatN definition returns a dataset that contains
   all sets of items up to and including those of size
   N where N must be >= MinN (whose default value is 2) The
   difference between this function and AprioriN is that this
   function using the "eclat" technique to produce its resultant
   dataset.

*/

   IMPORT ML;
   IMPORT ML.Docs AS Docs;
   d11 := DATASET([
      {'Is there need for a thorough textbook for Statistical Natural Language Processsing?'}
      ,{'At the same time, the availability of large text corpora has grown over the years.'}
      ,{'In this book we have tried to achieve a balance between theory and practice.'}
      ,{'We attempt to ground approaches in theoretical ideas, via math and linguistics.'}
      ,{'But, simultaneously we try to not let the material get too dry and boring.'}
      ,{'A lot of what we do is made up and has no foundation at all.'}
      ,{'But, we are into writing fiction and this is really a good mystery tail.'}
      ,{'So we hope you enjoy it and that it is not too scary... BOO'}
      ,{'As a final remark, we hope that this makes it into print that that everyone reads.'}
      ,{'Otherwise, I can buy the new Porche I saw in my local sport car dealership.'}
   ],
   {STRING r});
   d := d11;
   d1 := PROJECT(d,TRANSFORM(Docs.Types.Raw,SELF.Txt := LEFT.r));
   d2 := Docs.Tokenize.Enumerate(d1);
   d3 := Docs.Tokenize.Clean(d2);
   d4 := Docs.Tokenize.Split(d3);
   OUTPUT(d4,NAMED('d4'));
   lex := Docs.Tokenize.Lexicon(d4);
   o1 := Docs.Tokenize.ToO(d4,lex);
   o2 := Docs.Trans(O1).WordBag;
   ForAssoc:=PROJECT(o2,TRANSFORM(ML.Types.ItemElement,SELF.value:=LEFT.word,SELF:=LEFT));
   Apriori4:=ML.Associate(ForAssoc,3).EclatN(4);
   OUTPUT(SORT(Apriori4,-support),NAMED('Apriori4'));
