/*
   The Utils.Beta function calculates the mathematical Beta function
   given positive_number1 and positive_number2.

*/


  IMPORT ML;

   /*
     This example shows the similarity of the Beta function and the
     gamma function equivalent, i.e. gamma(x)*gamma(y)/gamma(x+y). 
     We find they are equivalent.
   */

   compare_beta_with_gamma_equal_rec := RECORD
      REAL8 x;
      REAL8 y;
      REAL8 beta_xy:=0;
      REAL8 gamma_x:=0;
      REAL8 gamma_y:=0;
      REAL8 beta_from_gamma:=0;
      REAL8 diff:=0;
      STRING ErrorPercent:='';
   END;

   compare_beta_with_gamma_equalDS :=
      DATASET([
               {2,3,0,0,0,0,0,''}
               ,{4,5,0,0,0,0,0,''}
               ,{8,6,0,0,0,0,0,''}
               ,{16,7,0,0,0,0,0,''}
               ,{32,8,0,0,0,0,0,''}
               ,{64,9,0,0,0,0,0,''}
               ,{128,10,0,0,0,0,0,''}
               ], compare_beta_with_gamma_equal_rec);

   compare_beta_with_gamma_equal_rec 
      cmpBetaWithGammaEquivalent( compare_beta_with_gamma_equal_rec r ) :=
      TRANSFORM
        beta_xy := ML.Utils.Beta(r.x,r.y);
        gamma_x := ML.Utils.gamma(r.x);
        gamma_y := ML.Utils.gamma(r.y);
        beta_from_gamma:=gamma_x * gamma_y/ML.Utils.gamma(r.x+r.y);
        diff:=abs(beta_xy-beta_from_gamma);
        ErrorPercent:=REALFORMAT(100*IF(diff=0,0.0,(1-(diff/beta_xy))),6,2);
        SELF.x := r.x;
        SELF.y := r.y;
        SELF.beta_xy := beta_xy;
        SELF.gamma_x := gamma_x;
        SELF.gamma_y := gamma_y;
        SELF.beta_from_gamma := beta_from_gamma;
        SELF.diff := diff;
        SELF.ErrorPercent := ErrorPercent;
      END;

   LoopBody := PROJECT(ROWS(LEFT),cmpBetaWithGammaEquivalent(LEFT));

   MyLoop := 
     LOOP(compare_beta_with_gamma_equalDS,7,LoopBody);

   OUTPUT(MyLoop);

