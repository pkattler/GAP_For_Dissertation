R := PolynomialRing(Integers, ["n"]);

AssignGeneratorVariables ( R);

A :=[ 
 [ [   60*n+3,   60*n+2,  -30*n-1,        0 ],
  [  -30*n-2,  -30*n-1,   15*n+1,        0 ],
  [     60*n,     60*n,  -30*n+1,        0 ],
  [  -60*n+8,  -60*n+8,   30*n-4,        1 ] ],
  
[ [               60*n-7,             120*n-20,                   -2,                   -2 ],
  [                    0,                    1,                    0,                    0 ],
  [             180*n-24,             360*n-60,                   -5,                   -6 ],
  [    1800*n^2-660*n+56,  3600*n^2-1440*n+140,             -60*n+14,             -60*n+15 ] ],
  
[ [    120*n+5,    120*n+4,    -30*n-1,          0 ],
  [    -60*n-4,    -60*n-3,     15*n+1,          0 ],
  [      240*n,      240*n,    -60*n+1,          0 ],
  [  -240*n+32,  -240*n+32,     60*n-8,          1 ] ],
  
[ [                180*n-23,                360*n-60,                      -2,                      -2 ],
  [                       0,                       1,                       0,                       0 ],
  [              1620*n-216,              3240*n-540,                     -17,                     -18 ],
  [    16200*n^2-5940*n+504,  32400*n^2-12960*n+1260,               -180*n+42,               -180*n+43 ] ],
  
[ [             120*n-15,             240*n-40,                   -8,                   -8 ],
  [                    0,                    1,                    0,                    0 ],
  [             180*n-24,             360*n-60,                  -11,                  -12 ],
  [    1800*n^2-660*n+56,  3600*n^2-1440*n+140,            -120*n+28,            -120*n+29 ] ],
  
[ [    990*n^2+69*n-2,  1980*n^2-12*n-21,         -120*n-12,           -60*n-6 ],
  [   -495*n^2-18*n+1,   -990*n^2+39*n+8,            60*n+4,            30*n+2 ],
  [    693*n^2+78*n-3,  1386*n^2+51*n-21,          -84*n-11,           -42*n-6 ],
  [   396*n^2-144*n+4,  792*n^2-348*n+28,          -48*n+16,           -24*n+9 ] ]
 ];

#A := ShallowList(A, x-> x*One(R));
A := A * One(R);

A1 := [ A[1],A[2],A[3],A[4],A[5],A[6],A[1] * A[2],A[1] * A[4],A[2] * A[1],A[2] * A[3],A[1] * A[2] * A[3],A[2] * A[4],A[3] * A[2],A[3]
 * A[2] * A[4],A[4] * A[1],A[4] * A[2] * A[3]];
  
A2 :=[A[1],A[2],A[3],A[4],A[5],A[6],A[1] * A[1],A[1] * A[2],A[1] * A[5],A[2] * A[1],A[2] * A[3],A[4] * A[6],A[3] * A[4] * A[6],A[6]
 * A[4],A[6] * A[1] * A[2],A[1] * A[2] * A[3] * A[4] * A[6]];
  
A3 :=   ShallowCopy( A2 );

A4 := [ A[1],A[2],A[3],A[4],A[5],A[6],A[1] * A[1],A[1] * A[2],A[1] * A[3],A[2] * A[1],A[2] * A[3],A[5] * A[6],A[1] * A[5] * A[6],A[3]
 * A[5] * A[6],A[6] * A[1] * A[3],A[3] * A[5] * A[6] * A[2] * A[1] ];

A5 := ShallowCopy(A1);
 
A6 := [  A[1],A[2],A[3],A[4],A[5],A[6],A[1] * A[1],A[1] * A[2],A[1] * A[3],A[2] * A[1],A[2] * A[3],A[5] * A[6],A[3] * A[5] * A[6],A[4]
 * A[5] * A[6],A[6] * A[1] * A[3],A[6] * A[1] * A[3] * A[4] ];

# This function maps a matrix in R^(nxn) to a vector in R^[n^2], by cluing the rows of the matrix behind each other.
IsomMatVec := function( A )
	local res, i;
	res := [];
	for i in [1..Length(A)] do
		Append( res, A[i]);
	od;
	return res;
end;

# The degree of the origami O_n is
d := 30*n +2;

f:= List([A1, A2, A3, A4, A5, A6], A-> DeterminantMat( List(A, IsomMatVec )));

# All f_i have the factor d^7, hence we divide by d^7
f := List(f, x-> x/d^7);

Print("The polynomials f1,.., f6 are:\n");
Perform(f, Display);

Print("We get the following resultants:\n");

r1 := Resultant( f[1] , f[2] , n );
r2 := Resultant( f[3] , f[4] , n );

Print("r1 ="); Print( r1 ); Print("\n\n");
Print("r2 ="); Print( r2 ); Print("\n\n");

Print("The greates largest divisor of r1 and r2 has the following prime factors: ");
fact := Factors( Gcd( [ r1, r2 ] ) );
Print( Set ( fact ) ); 
Print(" with powers "); Print( Length( Positions( fact, 2 ) ) );
Print(" and ");
Print( Length( Positions( fact, 5 ) ) ); Print(".");

Print("\nThe values of f5 mod 5 are: ");
Print( List([1..5], x-> Value( f[5], [n], [x] ) mod 5 ) );
Print(" for n in [1..5]");

Print("\nThe values of f2 mod 7 are: ");
Print( List([1..7], x-> Value( f[2], [n], [x] ) mod 7 ) );
Print(" for n in [1..7]");

Print("\nThe values of f6 mod 7 are: ");
Print( List([1..7], x-> Value( f[6], [n], [x] ) mod 7 ) );
Print(" for n in [1..7]");

# Now n = 30k -2
A :=
[
[ [   180*n+3,   180*n+2,   -90*n-1,         0 ],
  [   -90*n-2,   -90*n-1,    45*n+1,         0 ],
  [     180*n,     180*n,   -90*n+1,         0 ],
  [  -180*n+8,  -180*n+8,    90*n-4,         1 ] ],

[ [               180*n-7,              360*n-20,                    -2,                    -2 ],
  [                     0,                     1,                     0,                     0 ],
  [              540*n-24,             1080*n-60,                    -5,                    -6 ],
  [   16200*n^2-1980*n+56,  32400*n^2-4320*n+140,             -180*n+14,             -180*n+15 ] ],
  
[ [    360*n+5,    360*n+4,    -90*n-1,          0 ],
  [   -180*n-4,   -180*n-3,     45*n+1,          0 ],
  [      720*n,      720*n,   -180*n+1,          0 ],
  [  -720*n+32,  -720*n+32,    180*n-8,          1 ] ],
  
[ [                 540*n-23,                1080*n-60,                       -2,                       -2 ],
  [                        0,                        1,                        0,                        0 ],
  [               4860*n-216,               9720*n-540,                      -17,                      -18 ],
  [   145800*n^2-17820*n+504,  291600*n^2-38880*n+1260,                -540*n+42,                -540*n+43 ] ],
  
[ [              360*n-15,              720*n-40,                    -8,                    -8 ],
  [                     0,                     1,                     0,                     0 ],
  [              540*n-24,             1080*n-60,                   -11,                   -12 ],
  [   16200*n^2-1980*n+56,  32400*n^2-4320*n+140,             -360*n+28,             -360*n+29 ] ],
  
[ [  5400*n^2+180*n+1,      10800*n^2-12,        -1440*n-48,         -720*n-24 ],
  [    -2700*n^2-60*n,  -5400*n^2+60*n+5,          720*n+16,           360*n+8 ],
  [      900*n^2+30*n,        1800*n^2-2,          -240*n-7,          -120*n-4 ],
  [             -30*n,           -60*n+2,                 8,                 5 ] ]
  ];
 A7 := [A[1],A[2],A[3],A[4],A[5],A[6],A[1] * A[1],A[1] * A[2],A[1] * A[4],A[1] * A[6],A[2] * A[1],A[2] * A[3],A[2] * A[6],A[3] * A[2] * A[6],A[6] * A[1],A[6] * A[2]];
 # The degree of the origami O_n is
d := 90*n + 2;

f7 := DeterminantMat(List(A7,  IsomMatVec) *One(R));#DeterminantMat(  IsomMatVec( A7 ) );
f7 := f7/ d^7;
Print("\nThe values of f7 mod 3 are: ");
Print( List([1..3], x-> Value( f7, [n], [x] ) mod 3 ) );
Print(" for n in [1..3]");
