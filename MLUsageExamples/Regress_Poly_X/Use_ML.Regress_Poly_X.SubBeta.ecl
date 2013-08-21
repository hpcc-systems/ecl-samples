/*
No description found.
*/

   // Example given in Machine Learning Library Reference
   IMPORT ML;
   R := RECORD
   INTEGER rid;
   INTEGER Recs;
   REAL Time;
   END;
   d := 
       DATASET([
                {1,50000,1.00},
                {2,500000,2.29},
                {3,5000000,16.15},
                {4,25000000,80.2},
                {5,50000000,163},
                {6,100000000,316},
                {7,10,0.83},
                {8,1500000,5.63}
               ]
               ,R
       );
   ML.ToField(d,flds);
   OUTPUT(flds,NAMED('flds'));
   P := ML.Regress_Poly_X(flds(number=1),flds(number=2));
   P.SubBeta(3,6);
   <?dbfo-need height="1.0in" ?>
   /*
     SubBeta's Returned Dataset       
  id   name    value                   
   2   X0      0.8641658004063828  
   2   X       3.037243681895984e-06   
   2   XLogX   9.566179023998075e-16   
   2   XX     -6.511786739555933e-23  
   */
