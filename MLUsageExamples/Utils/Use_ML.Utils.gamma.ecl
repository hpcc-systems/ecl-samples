/*
   The Utils.gamma function calculates the mathematical gamma
   function given positive_number.

*/

   IMPORT ML;

   /*
     This example shows the similarity of the gamma function and the
     factorial function. In this example, we compare fac(x) with gamma(x+1).
     We find they are equivalent.
   */

   compare_fac_gamma_rec := RECORD
      UNSIGNED x;
      REAL8 fac:=0;
      REAL8 gamma_xPlus1:=0;
      REAL8 diff:=0;
      STRING ErrorPercent:='';
   END;

   compare_fac_gammaDS :=
      DATASET([
               {2,0,0,0,''}
               ,{4,0,0,0,''}
               ,{8,0,0,0,''}
               ,{16,0,0,0,''}
               ,{32,0,0,0,''}
               ,{64,0,0,0,''}
               ,{128,0,0,0,''}
               ], compare_fac_gamma_rec);

   compare_fac_gamma_rec calcFacApprxFacAndErrorPercent( compare_fac_gamma_rec r ) :=
      TRANSFORM
        Fac := ML.Utils.fac(r.x);
        gamma_xPlus1 := ML.Utils.gamma(r.x+1);
        diff:=abs(Fac-gamma_xPlus1);
        ErrorPercent:=REALFORMAT(100*IF(diff=0,0.0,(1-(diff/Fac))),6,2);
        SELF.x := r.x;
        SELF.fac := Fac;
        SELF.gamma_xPlus1 := gamma_xPlus1;
        SELF.diff := diff;
        SELF.ErrorPercent := ErrorPercent;
      END;

   LoopBody := PROJECT(ROWS(LEFT),calcFacApprxFacAndErrorPercent(LEFT));

   MyLoop := LOOP(compare_fac_gammaDS,7,LoopBody);

   OUTPUT(MyLoop);
