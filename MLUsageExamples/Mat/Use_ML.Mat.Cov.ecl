/*
   The ML.Mat.Cov function calculates the covariance of every
   pair of columns in input_matrix. So, element i,j of the
   returned matrix is the covariance of the ith column and the
   jth column of input_matrix.

*/

   IMPORT * FROM ML;
   A := DATASET([
                 {1,1,1.0},{1,2,2.0},{1,3,3.0},
                 {2,1,3.0},{2,2,4.0},{2,3,5.0},
                 {3,1,5.0},{3,2,6.0},{3,3,7.0}], ML.Mat.Types.Element);
   OUTPUT(A,NAMED('A'));

   CovA := ML.Mat.Cov(A);
   OUTPUT(CovA,NAMED('CovA'));
