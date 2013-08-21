/*
   The Utils.Poly function evaluates a polynomial from a set
   of Coeffs. Coeffs[1] is assumed to be the HIGH order of the
   equation. Thus, for ax^2+bx+c - Coeffs would be [a,b,c];
   <ulink url="http://en.wikipedia.org/wiki/Stirling%27s_approximation">http://en.wikipedia.org/wiki/Stirling%27s_approximation</ulink>

*/

IMPORT ML;
<emphasis>Coeffs</emphasis> := [1,2,3];
EvaledPolynomial := ML.Utils.Poly(5,<emphasis>Coeffs</emphasis>);
OUTPUT(EvaledPolynomial,NAMED('EvaledPolynomial'));
     // EvaledPolynomial is 38.0
