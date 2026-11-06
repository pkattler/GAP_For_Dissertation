Print("The action of a multi-twist in dirtection v on the nontautological part of the homology of the Origami O_n = F_1(2n-1):\n\n");

ApplyDehnTwistFormula := function( IntForm, CombLength, CombWidth, cyl)
	local res, A, b;
	A := 
	[ [     2,     0,     0,     0,     1,     0 ],
	  [     0,     1,     0,     0,     0,     0 ],
	  [    -1,  -3*n,     0,     0,     0,     0 ],
	  [     0,     0,     1,     0,     0,     1 ],
	  [     0,     0,     1,     3,     0,     0 ],
	  [     0,     0,    -1,    -1,     0,     0 ] ];
	A := ShallowList(A, x-> One(R)*x);  
	b := TransposedMat( List([1..4], i-> CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] + CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 4) + IdentityMat(4);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;



combLength1 := [ 3*n+3, 3*n+2 ];
combWidths1 := [1,1];
IntForm1 := -[ [ -1, 0, 1, 0 ], [ 1, 0, -1, 0 ] ];#[[1,0,1,0],[-1,0,-2,0]];
cyl1 := [  [ 2, 1, 2, 1, 3*n-2, 1 ], [ 0, 1, 2, 0, 3*n-1, 1 ] ];

Print("Direction: (2,1):\n");
Display( ApplyDehnTwistFormula( IntForm1, combLength1, combWidths1, cyl1 ) );
Print("\n\n\n\n");

combLength2 := [ 1, 6*n+4 ];
combWidths2 := [1,1];
IntForm2 := -[ [ -2, -1, 1, 0 ], [ 2, 1, -1, 0 ] ];#[[2,1,1,0], [-2,-1,-1,2]];
cyl2 := [ [ 1, 0, 0, 1, 0, 0 ], [ 0, 1, 2, 1, 12*n-6, 4 ] ];


Print("Direction: (1,2):\n");
Display( ApplyDehnTwistFormula( IntForm2, combLength2, combWidths2, cyl2 ) );
Print("\n\n\n\n");


combLength3 := [ 4*n+2, 2*n+3 ];
combWidths3 := [1,1];
IntForm3 := -[[0, -2*n+1,2,2],[0, 2*n-1,-2,-2]];
cyl3 :=[ -[ -2, -2, -2, -1, -8*n+4, -2 ], -[ -1, -1, -4, -1, -4*n+2, -2 ] ];
#cyl3 := [ [ 1, 0, 0, 1, 0, 0 ], [ 0, 1, 2, 1, 12*n-6, 4 ] ];

Print("Direction: (3,2):\n");
Display( ApplyDehnTwistFormula( IntForm3, combLength3, combWidths3, cyl3 ) );
Print("\n\n\n\n");



combLength4 := [ 2*n+1, 2*n + 2 ];
combWidths4 := [1,2];
IntForm4 := -[[-2,-2*n,4,2], [1,n,-2,-1],  [1,n,-2,-1]];
cyl4 := [ -[ -3, -1, 0, -1, -2*n+1, 0 ], -[ 0, -1, -3, 0, -2*n+1, -1 ],-[ 0, -1, -3, 0, -2*n+1, -1 ] ];

Print("Direction: (3,1):\n");
Display( ApplyDehnTwistFormula( IntForm4, combLength4, combWidths4,  cyl4 ) );
Print("\n\n\n\n");


#Direction (1,3)
combLength5 := [ 6*n+1, 2 ];
combWidths5 := [1,2];
IntForm5 := -[[-4,-12*n+4,2,2], [2,6*n-2,-1,-1]];
cyl5 := [ -[ -1, -1, 0, -3, -18*n+9, -2 ], -[ 0, 0, -1, 0, 0, -2 ] ];

Print("Direction: (1,3):\n");
Display( ApplyDehnTwistFormula( IntForm5, combLength5, combWidths5, cyl5 ) );
Print("\n\n\n\n");

T := [ApplyDehnTwistFormula( IntForm1, combLength1, combWidths1, cyl1 ), ApplyDehnTwistFormula( IntForm2, combLength2, combWidths2, cyl2 ), ApplyDehnTwistFormula( IntForm3, combLength3, combWidths3, cyl3 ), ApplyDehnTwistFormula( IntForm4, combLength4, combWidths4, cyl4 ),  ApplyDehnTwistFormula( IntForm5, combLength5, combWidths5, cyl5 )];




################################################ Now The even case #######################################################################
##########################################################################################################################################
##########################################################################################################################################
##########################################################################################################################################
##########################################################################################################################################



Print("The action of a multi-twist in dirtection v on the nontautological part of the homology of the Origami O_n = F_1(2n):\n\n");

ApplyDehnTwistFormula := function( IntForm, CombLength, CombWidth, cyl)
	local res, A, b, l;
	A := 
	[ [     1,     		0,    		 0,     0,     1,     0 ],
	  [     1,     		2,    		 0,     0,     0,     0 ],
	  [    -(3*n+2),  -(6*n +3),     0,     0,     0,     0 ],
	  [     0,     		0,    		 1,     0,     0,     1 ],
	  [     0,     		0,    		 1,     3,     0,     0 ],
	  [     0,     		0,    		-1,    -1,     0,     0 ] ];
	A := ShallowList(A, x-> One(R)*x);
	#l := Lcm( CombLength * One(R) );  
	b := TransposedMat( List([1..4], i->  CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] +   CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 4) + IdentityMat(4);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;

Print("Direction: (1,2):\n");
#direction (1,2)
combLength1 := [  6*n+7 ,  1  ];
combWidths1 :=  [ 1, 1 ];
IntForm1 := [ [ -2, -2, 1, 0 ], [ 2, 2, -1, 0 ] ];
cyl1 := [ [ 0, 1, 2, 1, 12*n, 4 ], [ 1, 0, 0, 1, 0, 0 ] ];

Display( ApplyDehnTwistFormula( IntForm1, combLength1, combWidths1, cyl1 ) );
Print("\n\n\n\n");

Print("Direction: (1,3):\n");
#direction(1,3)
combLength1 := [  6*n+4 ,  2  ]/2;
combWidths1 :=  [ 1, 2 ];
IntForm1 := [ [ 12*n+4, 24*n+4, -2, -2 ], [ -6*n-2, -12*n-2, 1, 1 ] ];
cyl1 := [ [ 1, 1, 0, 3, 18*n, 2 ], [ 0, 0, 1, 0, 0, 2 ] ];


Display( ApplyDehnTwistFormula( IntForm1, combLength1, combWidths1, cyl1 ) );
Print("\n\n\n\n");




Print("Direction: (1,4):\n");
#direction (1,4)
combLength1 := [  6*n+7 ,  1  ];
combWidths1 :=  [ 1, 1 ] ;
IntForm1 := [ [ -4, -4, 1, 0 ], [ 4, 4, -1, 0 ] ];
cyl1 := [ [ 0, 1, 2, 2, 24*n, 8 ], [ 1, 0, 0, 2, 0, 0 ] ];


Display( ApplyDehnTwistFormula( IntForm1, combLength1, combWidths1, cyl1 ) );
Print("\n\n\n\n");

# direction(1, 9)
Print("Direction: (1,9):\n");
combLength1 :=  [ 6*n+4 ,  2 ] /2;
combWidths1 := [ 1, 2 ];
IntForm1 := [ [ 36*n+12, 72*n+12, -2, -2 ], [ -18*n-6, -36*n-6, 1, 1 ] ];
cyl1 := [ [ 1, 1, 0, 9, 54*n, 6 ], [ 0, 0, 1, 0, 0, 6 ] ];

Display( ApplyDehnTwistFormula( IntForm1, combLength1, combWidths1, cyl1 ) );
Print("\n\n\n\n");


Print("Direction: (2,3):\n");
# direction(2,3)
combLength1 := [  6*n+4 , 1  ];
combWidths1 := [  1, 4  ];
IntForm1 := [ [ 12*n+4, 24*n+4, -4, -4 ], [ -3*n-1, -6*n-1, 1, 1 ] ];
cyl1 := [ [ 2, 2, 0, 3, 18*n, 2 ], [ 0, 0, 1, 0, 0, 1 ] ];

Display( ApplyDehnTwistFormula( IntForm1, combLength1, combWidths1, cyl1 ) );
Print("\n\n\n\n");

# direction (5,8)
Print("Direction: (5,8):\n");
ApplyDehnTwistFormula := function( IntForm, CombLength, CombWidth, cyl)
	local res, A, b, l;
	A := 
	[ [     1,     		0,    		 0,     0,     1,     0 ],
	  [     1,     		2,    		 0,     0,     0,     0 ],
	  [    -(15*n-1),  -(30*n-3),     0,     0,     0,     0 ],
	  [     0,     		0,    		 1,     0,     0,     1 ],
	  [     0,     		0,    		 1,     3,     0,     0 ],
	  [     0,     		0,    		-1,    -1,     0,     0 ] ];
	A := ShallowList(A, x-> One(R)*x);  
	b := TransposedMat( List([1..4], i->  CombLength[1]*CombWidth[2]*IntForm[2][i]*cyl[2] +   CombLength[2]*CombWidth[1]*IntForm[1][i]*cyl[1]) );
	return   CutOutMatrix(A^-1*b, 4) + IdentityMat(4);#List( [1..4], x-> (A^-1*b)[x] ) + IdentityMat(4); 
end;


combLength1 := [  24*n+2 ,  6*n  ]/2;
combWidths1 := [ 1, 1 ];
IntForm1 := [ [ -33*n+1, -66*n+7, 4, 2 ], [ 33*n-1, 66*n-7, -4, -2 ] ];
cyl1 := [ [ 2, 4, 10, 5, 192*n-39, 15 ], [ 3, 1, 0, 3, 48*n-9, 1 ] ];

Display( ApplyDehnTwistFormula( IntForm1, combLength1, combWidths1, cyl1 ) );
Print("\n\n\n\n");
#T := [ApplyDehnTwistFormula( IntForm1, combLength1, combWidths1, cyl1 ), ApplyDehnTwistFormula( IntForm2, combLength2, combWidths2, cyl2 ), ApplyDehnTwistFormula( IntForm3, combLength3, combWidths3, cyl3 ), ApplyDehnTwistFormula( IntForm4, combLength4, combWidths4, cyl4 ),  ApplyDehnTwistFormula( IntForm5, combLength5, combWidths5, cyl5 )];



