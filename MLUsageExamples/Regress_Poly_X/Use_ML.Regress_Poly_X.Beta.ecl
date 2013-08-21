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
   P := ML.Regress_Poly_X(flds(number=1),flds(number=2),3);
   P.Beta;
   <?dbfo-need height="1.0in" ?>
   /*
         Beta Dataset             
  id   name    value                  
   2   X0      1.289012943111203  
   2   LogX   -0.1809435529083999  
   2   X       3.306473769157685e-06  
   2   XLogX  -1.78603572714734e-16  
   */
