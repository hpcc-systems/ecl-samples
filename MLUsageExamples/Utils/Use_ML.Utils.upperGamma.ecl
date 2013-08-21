/*
   The Utils.upperGamma function calculates the upper incomplete
   gamma function of positive_number1 and positive_number2.

*/

   IMPORT ML;

   /*
     This example calculates both the upper and lower incomplete
     gamma function.
   */

   lgamma_ugamma_rec := RECORD
      REAL8 x;
      REAL8 y;
      REAL8 ugamma_xy:=0;
      REAL8 lgamma_xy:=0;
   END;

   lgamma_ugammaDS :=
      DATASET([
               {3,5.5,0,0}
               ,{4,5,0,0}
               ,{8,6,0,0}
               ,{16,7,0,0}
               ,{32,8,0,0}
               ,{64,9,0,0}
               ,{128,10,0,0}
               ], lgamma_ugamma_rec);

   lgamma_ugamma_rec 
      cmpBetaWithGammaEquivalent( lgamma_ugamma_rec r ) :=
        TRANSFORM
           lgamma_xy := ML.Utils.upperGamma(r.x,r.y);
           ugamma_xy := ML.Utils.upperGamma(r.x,r.y);
           SELF.x := r.x;
           SELF.y := r.y;
           SELF.lgamma_xy := lgamma_xy;
           SELF.ugamma_xy := ugamma_xy;
        END;

   MyLoop := LOOP(lgamma_ugammaDS,7,PROJECT(ROWS(LEFT),cmpBetaWithGammaEquivalent(LEFT)));

   OUTPUT(MyLoop);
