R := PolynomialRing(Integers,"n");
AssignGeneratorVariables( R );
Rs := PolynomialRing(Integers,"s");
AssignGeneratorVariables( Rs );
Rt := PolynomialRing(Integers,"t");
AssignGeneratorVariables( Rt );

Print("\n\n\n The orbit of O^1_n: \n\n\n");
Print("direction = (2n+1, 2):\n");

ApplyDehnTwistFormula1 := function( IntForm, CombLength, CombWidth, cyl) 
	local res, A, b;
	A := 
	[ [     (n+1),     0,     1,     0],
	  [   -(n),     0,     0, 0],
	  [     0,     1,     0,     1 ],
	  [     0,    -1,     0,     0  ]
	];
	A := One(R)*A;  
	b := TransposedMat( List([1..2], i-> CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] + CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 2) + IdentityMat(2);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;

combLength1 := [  1 , 2*n  ];
combWidths1 :=  [ 1, 1 ]; 
IntForm1 := [ [ 1, 0 ], [ -1, 0 ] ];
cyl1 := [ [ 1, 1, 1, 1 ], [ 2*n, 2*n, 2*n-1, 2*n+1 ] ];

Display(  ApplyDehnTwistFormula1( IntForm1, combLength1, combWidths1, cyl1 ) ) ;

Print("Direction = (1, 0):\n");

combLength1 := [  n , n+1  ];
combWidths1 := [  1, 1  ];
IntForm1 := [ [ 0, -1 ], [ 0, 1 ] ];
cyl1 := [ [ 1, 0, 0, 0 ], [ 0, 1, 0, 0 ] ];


Display(  ApplyDehnTwistFormula1( IntForm1, combLength1, combWidths1, cyl1 ) ) ;

Print("\n\n\n The orbit of O^2_n: \n\n\n");
Print("\nt = 6*n-4, direction = (2,1):\n");


ApplyDehnTwistFormula1 := function( IntForm, CombLength, CombWidth, cyl) # for n = 6*i-4
	local res, A, b;
	A := 
	[ [     (6*t-2),     0,     1,     0],
	  [   -(6*t-1),     0,     0, 0],
	  [     0,     1,     0,     1 ],
	  [     0,    -1,     0,     0  ]
	];
	A := One(R)*A;  
	b := TransposedMat( List([1..2], i-> CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] + CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 2) + IdentityMat(2);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;





IntForm1 :=  [ [ -18*t^2+21*t-4, -1 ], [ 36*t^2-42*t+8, 2 ] ];
combLength1 :=  [ 3*t-1, 6*t-1 ];
combWidths1 :=  [  2, 1  ];
cyl1 :=  [ [ 0, 1, 3*t-2, 1 ], [ 2, 0, 2, 6*t-3 ] ];
Display(  ApplyDehnTwistFormula1( IntForm1, combLength1, combWidths1, cyl1 ) ) ;


Print("\n t = 6*n-1, direction = (2,1):\n");

ApplyDehnTwistFormula1 := function( IntForm, CombLength, CombWidth, cyl) # for n = 6*i-1
	local res, A, b;
	A := 
	[ [     (6*t+1),     0,     1,     0],
	  [   -(6*t+2),     0,     0, 0],
	  [     0,     1,     0,     1 ],
	  [     0,    -1,     0,     0  ]
	];
	A := One(R)*A;  
	b := TransposedMat( List([1..2], i-> CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] + CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 2) + IdentityMat(2);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;

IntForm1 :=  [ [ -36*t^2+6*t+4, -2 ], [ 18*t^2-3*t-2, 1 ] ];
combLength1 :=  [ 6*t+1, 3*t+1 ];
combWidths1 :=  [  1, 2  ];
cyl1 :=  [ [ 0, 2, 6*t-1, 2 ], [ 1, 0, 1, 3*t ] ];

Display(  ApplyDehnTwistFormula1( IntForm1, combLength1, combWidths1, cyl1 ) ) ;

ApplyDehnTwistFormula1 := function( IntForm, CombLength, CombWidth, cyl) # for n = 6*i
	local res, A, b;
	A := 
	[ [     (6*t+2),     0,     1,     0],
	  [   -(6*t+3),     0,     0, 0],
	  [     0,     1,     0,     1 ],
	  [     0,    -1,     0,     0  ]
	];
	A := One(R)*A;  
	b := TransposedMat( List([1..2], i-> CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] + CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 2) + IdentityMat(2);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;


Print("\nt = 6*n, direction = (12*t+3,1):\n");

IntForm1 :=  [ [ 36*t^2+30*t+6, -2 ], [ -18*t^2-15*t-3, 1 ] ];
combLength1 :=  [ 6*t+3, 3*t+1 ];
combWidths1 :=  [  1, 2  ];
cyl1 :=  [ [ 6*t+1, 6*t+3, 0, 6*t+3 ], [ 3*t+1, 3*t, 3*t+1, 0 ] ];

Display(  ApplyDehnTwistFormula1( IntForm1, combLength1, combWidths1, cyl1 ) ) ;



ApplyDehnTwistFormula1 := function( IntForm, CombLength, CombWidth, cyl) # for n = 6*i-3
	local res, A, b;
	A := 
	[ [     (6*t-1),     0,     1,     0],
	  [   -(6*t),     0,     0, 0],
	  [     0,     1,     0,     1 ],
	  [     0,    -1,     0,     0  ]
	];
	A := One(R)*A;  
	b := TransposedMat( List([1..2], i-> CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] + CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 2) + IdentityMat(2);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;

Print("\nt = 6*n - 3, direction = (12*t-3,1):\n");

IntForm1 :=  [ [ 18*t^2-3*t, -1 ], [ -36*t^2+6*t, 2 ] ];
combLength1 :=  [ 3*t, 6*t-1 ];
combWidths1 :=  [  2, 1  ];
cyl1 :=  [ [ 3*t-1, 3*t, 0, 3*t ], [ 6*t-1, 6*t-3, 6*t-1, 0 ] ];

Display(  ApplyDehnTwistFormula1( IntForm1, combLength1, combWidths1, cyl1 ) ) ;



ApplyDehnTwistFormula1 := function( IntForm, CombLength, CombWidth, cyl) # for n = 6*i-2
	local res, A, b;
	A := 
	[ [     (6*t),     0,     1,     0],
	  [   -(6*t+1),     0,     0, 0],
	  [     0,     1,     0,     1 ],
	  [     0,    -1,     0,     0  ]
	];
	A := One(R)*A;  
	b := TransposedMat( List([1..2], i-> CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] + CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 2) + IdentityMat(2);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;

Print("\nt = 6*n - 2, direction = (12*t-1,1):\n");

IntForm1 :=  [ [ 36*t^2+6*t, -2 ], [ -18*t^2-3*t, 1 ] ];
combLength1 :=  [ 6*t+1, 3*t ];
combWidths1 :=  [  1, 2  ];
cyl1 :=  [ [ 6*t-1, 6*t+1, 0, 6*t+1 ], [ 3*t, 3*t-1, 3*t, 0 ] ];


Display(  ApplyDehnTwistFormula1( IntForm1, combLength1, combWidths1, cyl1 ) ) ;

ApplyDehnTwistFormula1 := function( IntForm, CombLength, CombWidth, cyl) # for n = 6*i-5
	local res, A, b;
	A := 
	[ [     (6*t-3),     0,     1,     0],
	  [   -(6*t-2),     0,     0, 0],
	  [     0,     1,     0,     1 ],
	  [     0,    -1,     0,     0  ]
	];
	A := One(R)*A;  
	b := TransposedMat( List([1..2], i-> CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] + CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 2) + IdentityMat(2);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;

Print("\nt = 6*n - 5, direction = (12*t-7,1):\n");

IntForm1 :=  [ [ 18*t^2-15*t+3, -1 ], [ -36*t^2+30*t-6, 2 ] ];
combLength1 :=  [ 3*t-1, 6*t-3 ];
combWidths1 :=  [  2, 1  ];
cyl1 :=  [ [ 3*t-2, 3*t-1, 0, 3*t-1 ], [ 6*t-3, 6*t-5, 6*t-3, 0 ] ];

Display(  ApplyDehnTwistFormula1( IntForm1, combLength1, combWidths1, cyl1 ) ) ;


##### n = 3*i -1 dir = (18n+9,6n+2)


ApplyDehnTwistFormula1 := function( IntForm, CombLength, CombWidth, cyl) 
	local res, A, b;
	A := 
	[ [     (3*s+1),     0,     1,     0],
	  [   -(3*s+2),     0,     0, 0],
	  [     0,     1,     0,     1 ],
	  [     0,    -1,     0,     0  ]
	];
	A := One(R)*A;  
	b := TransposedMat( List([1..2], i-> CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] + CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 2) + IdentityMat(2);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;

Print("\ns = 3*n - 1, direction = (18s+9,6s+2):\n");

IntForm1 :=  [ [ -2, 0 ], [ 1, 0 ] ];
combLength1 :=  [ 6*s-1, 2 ];
combWidths1 :=  [  1, 2  ];
cyl1 :=  [ [ 18*s-3, 18*s-3, 18*s^2, 18*s^2+6*s-2 ], [ 6, 6, 6*s+1, 6*s+3 ] ];


Display(  ApplyDehnTwistFormula1( IntForm1, combLength1, combWidths1, cyl1 ) ) ;

## n = 3i

ApplyDehnTwistFormula1 := function( IntForm, CombLength, CombWidth, cyl) 
	local res, A, b;
	A := 
	[ [     (3*s+2),     0,     1,     0],
	  [   -(3*s+3),     0,     0, 0],
	  [     0,     1,     0,     1 ],
	  [     0,    -1,     0,     0  ]
	];
	A := One(R)*A;  
	b := TransposedMat( List([1..2], i-> CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] + CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 2) + IdentityMat(2);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;


Print("\ns = 3*n , direction = (6s+5,3s+1):\n");



IntForm1 :=  [ [ 1, 0 ], [ -2, 0 ] ];
combLength1 :=  [ 2*s+3, 2*s-1 ];
combWidths1 :=  [  2, 1  ];
cyl1 :=  [ [ 2*s+3, 2*s+3, 3*s^2+5*s+1, 3*s^2+6*s+2 ], [ 2*s-1, 2*s-1, 3*s^2-s, 3*s^2-1 ] ];

Display(  ApplyDehnTwistFormula1( IntForm1, combLength1, combWidths1, cyl1 ) ) ;

## n = 3i-2
Print("\ns = 3*n -2 , direction = (6s+1,3s-1):\n");

ApplyDehnTwistFormula1 := function( IntForm, CombLength, CombWidth, cyl) 
	local res, A, b;
	A := 
	[ [     (3*s+2),     0,     1,     0],
	  [   -(3*s+3),     0,     0, 0],
	  [     0,     1,     0,     1 ],
	  [     0,    -1,     0,     0  ]
	];
	A := One(R)*A;  
	b := TransposedMat( List([1..2], i-> CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] + CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 2) + IdentityMat(2);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;

IntForm1 :=  [ [ 2, 0 ], [ -1, 0 ] ];
combLength1 :=  [ 2*s+3, 2*s-1 ];
combWidths1 :=  [  1, 2 ];
cyl1 :=  [ [ 2*s+3, 2*s+3, 3*s^2+3*s-2, 3*s^2+4*s-1 ], [ 2*s-1, 2*s-1, 3*s^2-3*s+1, 3*s^2-2*s ] ];


Display(  ApplyDehnTwistFormula1( IntForm1, combLength1, combWidths1, cyl1 ) ) ;

######################################## O^(3,1)_n #####################################################
Print("\n\n\nThe orbit of O^(3,1)_n Directions:  (2n+1, 1) and (d, 2n+1)\n\n\n");
ApplyDehnTwistFormula2 := function( IntForm, CombLength, CombWidth, cyl)
	local res, A, b;
	A := 
	[ [     (2*n+1),     0,     1,     0],
	  [   -(2*n+3),     0,     0, 0],
	  [     0,     1,     0,     1 ],
	  [     0,    -1,     0,     0  ]
	];
	A := One(R)*A;  
	b := TransposedMat( List([1..2], i-> CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] + CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 2) + IdentityMat(2);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;

	IntForm1 := [[2*n+1, -1],[-4*n-2,2 ]]; #[ [ 1, 0, -1, 0 ], [ 1, 0, -1, 0 ], [ 2*n+1, 2*n+1, -2*n+1, -2*n-1 ] ]
	combLength1 :=[1, 4*n+2];
	combWidths1 := [2, 1];
	cyl1 := [[0,1,0,1], [  2*n+1,  2*n-1,  2*n+1,  2*n+1 ] ];
	
	Display(  ApplyDehnTwistFormula2( IntForm1, combLength1, combWidths1, cyl1 ) ) ;
	
	IntForm2 := [[-1, 0],[1,0 ]]; # [ 4*n^2+7*n+2, 4*n^2+3*n+1, -4*n-3, -4*n-3 ], [ n+1, n, -1, -1 ] 
	combLength2 :=[ 4*n + 3, 1];
	combWidths2 := [1, 1];
	cyl2 := [[ 4*n+3, 4*n+3, 4*n^2+3*n+1, 4*n^2+7*n+2 ], [ 1, 1, n, n+1 ] ];
	
	Display(  ApplyDehnTwistFormula2( IntForm2, combLength2, combWidths2, cyl2 ) ) ;	


###################################################### 	O^(3,2)_n #######################################################
##dir (1,1)
Print("\n\n\nThe orbit of O^(3,2)_n\n\n\n");
Print("Direction(1,1):\n");
ApplyDehnTwistFormula3 := function( IntForm, CombLength, CombWidth, cyl)
	local res, A, b;
	A := 
	[ [     (2*n+1),     0,     1,     0],
	  [   -(2*n+5),     0,     0, 0],
	  [     0,     1,     0,     1 ],
	  [     0,    -1,     0,     0  ]
	];
	A := One(R)*A;  
	b := TransposedMat( List([1..2], i-> CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] + CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 2) + IdentityMat(2);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;

	IntForm1 :=  [[-6*n-5, -1],[6*n+5,1]]; # [ [ n, n+1, -1, 0 ], [ n+5, n, 0, -1 ] ]
	combLength1 := [2*n+1, 2*n+5];
	combWidths1 := [1, 1];
	cyl1 := [ [ 0, 1, n+1, n ], [ 1, 0, n, n+5 ] ];
	
	Display(  ApplyDehnTwistFormula3( IntForm1, combLength1, combWidths1, cyl1 ) ) ;

# dir floor...
#n = 2*i	dir = (4n+3, 2n+1)
Print("\nDirection (4n+3, 2n+1) for even n\n\n");

ApplyDehnTwistFormula3 := function( IntForm, CombLength, CombWidth, cyl)
	local res, A, b;
	A := 
	[ [     (4*n+1),     0,     1,     0],
	  [   -(4*n+5),     0,     0, 0],
	  [     0,     1,     0,     1 ],
	  [     0,    -1,     0,     0  ]
	];
	A := One(R)*A;  
	b := TransposedMat( List([1..2], i-> CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] + CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 2) + IdentityMat(2);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;


	IntForm2 :=  [ [ 2, 0 ], [ -2, 0 ] ];
	combLength2 := [ 2 , 8*n+4 ]/2;
	combWidths2 := [1, 1];
	cyl2 :=  [ [ 1, 1, 2*n, 2*n+2 ], [ 4*n+2, 4*n+2, 8*n^2+4*n+1, 8*n^2+12*n+3 ] ];
	Display(  ApplyDehnTwistFormula3( IntForm2, combLength2, combWidths2, cyl2 ) ) ;

# n = 2*i-1 dir = (4n+1, 2n+1)

Print("\nDirection (4n+1, 2n+1) for odd n\n\n");

ApplyDehnTwistFormula3 := function( IntForm, CombLength, CombWidth, cyl)
	local res, A, b;
	A := 
	[ [     (4*n-1),     0,     1,     0],
	  [   -(4*n+3),     0,     0, 0],
	  [     0,     1,     0,     1 ],
	  [     0,    -1,     0,     0  ]
	];
	A := One(R)*A;  
	b := TransposedMat( List([1..2], i-> CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] + CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 2) + IdentityMat(2);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;


	IntForm3 :=  [ [ 2, 0 ], [ -2, 0 ] ];
	combLength3 := [ 8*n, 2 ]/2;
	combWidths3 := [1, 1];
	cyl3 :=  [ [ 4*n, 4*n, 8*n^2-1, 8*n^2+8*n+1 ], [ 1, 1, 2*n, 2*n+2 ] ];
	Display(  ApplyDehnTwistFormula3( IntForm3, combLength3, combWidths3, cyl3 ) ) ;


###################################### L3 first case #####################################################

Print("\n\n\nThe orbit of O^(4,1)_n directions (d,1) and then (1,0)\n\n\n");

ApplyDehnTwistFormula4 := function( IntForm, CombLength, CombWidth, cyl) # erst direction (d,1)
	local res, A, b;
	A := 
	[ [     (2*n+3),     0,     1,     0],
	  [   -(2*n+1),     0,     0, 0],
	  [     0,     1,     0,     1 ],
	  [     0,    -1,     0,     0  ]
	];
	A := One(R)*A;  
	b := TransposedMat( List([1..2], i-> CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] + CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 2) + IdentityMat(2);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;

	IntForm1 := [[1,0], [-1,0]];  #[ [ n+1, n+2, -2*n-3, -2*n-3 ], [ n, n+1, -2*n-1, -2*n-1 ] ]
	combLength1 := [  2*n+3 ,  2*n+1  ];
	combWidths1 := [1, 1];
	cyl1 := [ [ 2*n+3, 2*n+3, n+1, n+2 ], [ 2*n+1, 2*n+1, n, n+1 ] ];
	
	Display(  ApplyDehnTwistFormula4( IntForm1, combLength1, combWidths1, cyl1 ) ) ;
	
	IntForm2 :=  [[0,-1],[0,1]]; #[ [ 0, 0, -1, 0 ], [ 0, 0, 0, -1 ] ]
	combLength2 := [ 2*n+1 ,  2*n+3];
	combWidths2 := [1, 1];
	cyl2 := [ [ 1, 0, 0, 0 ], [ 0, 1, 0, 0 ] ];
	
	Display(  ApplyDehnTwistFormula4( IntForm2, combLength2, combWidths2, cyl2 ) ) ;
	
############################################## L3 second case ##########################################


## direction (d,1)  Ungerade richtung:

Print("\n\n\nThe orbit of O^(4,2)_n  \n\n\n");

Print("Direction (1,0)\n");

ApplyDehnTwistFormula5 := function( IntForm, CombLength, CombWidth, cyl) # 
	local res, A, b;
	A := 
	[ [     (4*n+3),     0,     1,     0],
	  [   -(4*n-1),     0,     0, 0],
	  [     0,     1,     0,     1 ],
	  [     0,    -1,     0,     0  ]
	];
	A := One(R)*A;  
	b := TransposedMat( List([1..2], i-> CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] + CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 2) + IdentityMat(2);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;

	
	
	IntForm1 := [[1, 0], [-1, 0]]; #[ [ n, n+1, -2*n-1, -2*n-1 ], [ 3*n-1, 3*n+2, -6*n-1, -6*n-1 ] ]
	combLength1 :=  [2*n+1, 6*n+1];
	combWidths1 := [1,1];
	cyl1 := [ [ 2*n+1, 2*n+1, n, n+1 ], [ 6*n+1, 6*n+1, 3*n-1, 3*n+2 ] ];
	
	Display(  ApplyDehnTwistFormula5( IntForm1, combLength1, combWidths1, cyl1 ) ) ;
	
## direction (d,1)  Gerade richtung:
Print("\nDirection (d,1) for even n:\n");

ApplyDehnTwistFormula6 := function( IntForm, CombLength, CombWidth, cyl) # erst direction (d,1)
	local res, A, b;
	A := 
	[ [     (4*n+5),     0,     1,     0],
	  [   -(4*n-1),     0,     0, 0],
	  [     0,     1,     0,     1 ],
	  [     0,    -1,     0,     0  ]
	];
	A := One(R)*A;  
	b := TransposedMat( List([1..2], i-> CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] + CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 2) + IdentityMat(2);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;
	
	IntForm2 :=  [[1,0],[-1,0]]; # [ [ 3*n+1, 3*n+4, -6*n-5, -6*n-5 ], [ n, n+1, -2*n-1, -2*n-1 ] ] n = 2*K
	combLength2 := [6*n+5, 2*n+1 ];
	combWidths2 := [1,1];
	cyl2 := [ [ 6*n+5, 6*n+5, 3*n+1, 3*n+4 ], [ 2*n+1, 2*n+1, n, n+1 ] ];
	
	Display(  ApplyDehnTwistFormula6( IntForm2, combLength2, combWidths2, cyl2 ) ) ;


################ direction (1,0)
Print("\nDirection (d,1) for odd n:\n");
ApplyDehnTwistFormula7 := function( IntForm, CombLength, CombWidth, cyl) #
	local res, A, b;
	A := 
	[ [     (2*n+3),     0,     1,     0],
	  [   -(2*n+1),     0,     0, 0],
	  [     0,     1,     0,     1 ],
	  [     0,    -1,     0,     0  ]
	];
	A := One(R)*A;  
	b := TransposedMat( List([1..2], i-> CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] + CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 2) + IdentityMat(2);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;
	
	IntForm3 :=  [[0,-1],[0,1]];
	combLength3 := [2*n+1, 2*n+5];
	combWidths3 := [1,1];
	cyl3 := [ [ 1, 0, 0, 0 ], [ 0, 1, 0, 0 ] ];
	
	Display(  ApplyDehnTwistFormula7( IntForm3, combLength3, combWidths3, cyl3 ) ) ;		

