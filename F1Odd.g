R := PolynomialRing(Integers, ["n"]);

AssignGeneratorVariables ( R);

A :=[ 
 [ [   3*n+3,       0,  -3*n-2,       0 ],
  [      -1,       1,       1,       0 ],
  [   3*n+2,       0,  -3*n-1,       0 ],
  [  -3*n-1,       0,   3*n+1,       1 ] ],
  
[ [    6*n+5,    3*n+2,   -3*n-2,        0 ],
  [       -2,        0,        1,        0 ],
  [   12*n+6,    6*n+3,   -6*n-2,        0 ],
  [  -12*n+2,   -6*n+1,    6*n-1,        1 ] ],
  
[ [              1,          4*n-2,             -4,             -4 ],
  [              0,          8*n-3,             -8,             -8 ],
  [              0,   -4*n^2+4*n-1,          4*n-1,          4*n-2 ],
  [              0,  12*n^2-12*n+3,        -12*n+6,        -12*n+7 ] ],
  
[ [      6*n+7,  6*n^2+6*n,   -12*n-12,     -6*n-6 ],
  [          2,      2*n+1,         -4,         -2 ],
  [      4*n+4,  4*n^2+4*n,     -8*n-7,     -4*n-4 ],
  [         -2,       -2*n,          4,          3 ] ],
  
[ [                 5,            12*n-4,                -2,                -2 ],
  [                 8,            24*n-7,                -4,                -4 ],
  [                24,           72*n-24,               -11,               -12 ],
  [           48*n-32,  144*n^2-144*n+32,          -24*n+16,          -24*n+17 ] ]
 ];

#A := ShallowList(A, x-> x*One(R));
A := List( A, x-> List(x, y->List(y, z-> z*One(R) )));

A1 := [ A[1],A[2],A[3],A[4],A[5],A[1] * A[1],A[1] * A[4],A[1] * A[5],A[2] * A[5],A[3] * A[1] * A[4],A[2] * A[3] * A[1] * A[4],A[3] * A[1] * A[5],A[4] * A[1],A[4] * A[2] * A[3] * A[1] * A[4],A[1] * A[4] * A[2] * A[3] * A[1] * A[4],A[5] * A[1]];
  
A2 := [ A[1],A[2],A[3],A[4],A[5],A[1] * A[1],A[1] * A[2],A[1] * A[5],A[2] * A[1],A[2] * A[5],A[4] * A[2] * A[1],A[3] * A[4] * A[2] * A[1],A[5] * A[3] * A[4] * A[2] * A[1],A[1] * A[2] * A[3] * A[4] * A[2] * A[1],A[4] * A[2] * A[1] * A[3],A[3] * A[4] * A[2] * A[1] * A[2] ];
  
A3 :=  [ A[1],A[2],A[3],A[4],A[5],A[1] * A[1],A[1] * A[3],A[1] * A[4],A[1] * A[5],A[2] * A[4],A[2] * A[5],A[3] * A[1],A[3] * A[4],A[3] * A[1] * A[5],A[4] * A[1],A[2] * A[4] * A[1] ];

A4 := ShallowCopy( A2 );

A5 := [A[1],A[2],A[3],A[4],A[5],A[1] * A[1],A[1] * A[2],A[1] * A[3],A[1] * A[4],A[2] * A[1],A[2] * A[3],A[2] * A[5],A[3] * A[1],A[3] * A[2],A[3] * A[4],A[4] * A[1] ];
  
A6 := [ A[1],A[2],A[3],A[4],A[5],A[1] * A[1],A[1] * A[5],A[2] * A[5],A[3] * A[1] * A[5],A[2] * A[3] * A[1] * A[5],A[1] * A[2] * A[3] * A[1] * A[5],A[4] * A[2] * A[5],A[1] * A[4] * A[2] * A[5],A[2] * A[1] * A[4] * A[2] * A[5],A[3] * A[4] * A[2] * A[5],A[4] * A[1] * A[2] * A[3] * A[1] * A[5] ];

A7 := [ A[1],A[2],A[3],A[4],A[5],A[1] * A[1],A[2] * A[4],A[1] * A[2] * A[4],A[2] * A[5],A[3] * A[5],A[3] * A[2] * A[4],A[4] * A[2],A[1] * A[4] * A[2],A[2] * A[4] * A[1],A[1] * A[2] * A[4] * A[3],A[4] * A[2] * A[2] * A[4] * A[1]];

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
d := 6*n +5;

f:= List([A1, A2, A3, A4, A5, A6, A7], A-> DeterminantMat( List(A, IsomMatVec )));

# All f_i have the factor d^7, hence we divide by d^7
f := List(f, x-> x/d^7);

Print("The polynomials f1,.., f7 are:\n");
Perform(f, Display);

Print("We get the following resultants:\n");

r1 := Resultant( f[1] , f[2] , n );
r2 := Resultant( f[3] , f[4] , n );
r3 := Resultant( f[5] , f[6] , n );

Print("r1 ="); Print( r1 ); Print("\n\n");
Print("r2 ="); Print( r2 ); Print("\n\n");
Print("r3 ="); Print( r3 ); Print("\n\n");
Print("The greates largest divisor of r1, r2 and r3 has the following prime factors: ");
fact := Factors( Gcd( [ r1, r2 , r3 ] ) );
Print( Set ( fact ) ); 
Print(" with powers "); Print( Length( Positions( fact, 2 ) ) );
Print(" and ");
Print( Length( Positions( fact, 5 ) ) ); Print(".");

Print("\nThe values of f1 mod 5 are: ");
Print( List([1..5], x-> Value( f[7], [n], [x] ) mod 5 ) );
Print(" for n in [1..5]");
