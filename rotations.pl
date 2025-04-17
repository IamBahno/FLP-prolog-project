% rotate only face (9 values), by center clockwise
rotate_face_clockwise([A1,A2,A3,A4,A5,A6,A7,A8,A9],S):-
    S = [A7,A4,A1,A8,A5,A2,A9,A6,A3].

% rotate only face (9 values), by center counter clockwise
rotate_face_counter_clockwise([A1,A2,A3,A4,A5,A6,A7,A8,A9],S):-
    S = [A3,A6,A9,A2,A5,A8,A1,A4,A7].

% perform sort of barrel roll, rotates sandwich layer clockwise, by the center, only the 12  out facing values
rol_3_clockwise([W1,W2,W3,
            X1,X2,X3,
            Y1,Y2,Y3,
            Z1,Z2,Z3],OUT):-
        OUT =[X1,X2,X3,
            Y1,Y2,Y3,
            Z1,Z2,Z3,
            W1,W2,W3]
        .
% perform sort of barrel roll, rotates sandwich layer counter clockwise, by the center, only the 12  out facing values
rol_3_counter_clockwise([W1,W2,W3,
            X1,X2,X3,
            Y1,Y2,Y3,
            Z1,Z2,Z3],OUT):-
        OUT =[Z1,Z2,Z3,
            W1,W2,W3,
            X1,X2,X3,
            Y1,Y2,Y3]
        .

% U - Turn the top (up) face clockwise
 rotate('U',cube(
		[A1,A2,A3,F4,F5,F6,F7,F8,F9],   % Front
		[A4,A5,A6,R4,R5,R6,R7,R8,R9],   % Right
		[A7,A8,A9,B4,B5,B6,B7,B8,B9],   % Back
		[A10,A11,A12,L4,L5,L6,L7,L8,L9],   % Left
		U,   % Up
		D    % Down
	),OUT) :-
        rol_3_clockwise([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12],
        [W1,W2,W3,X1,X2,X3,Y1,Y2,Y3,Z1,Z2,Z3]),
        rotate_face_clockwise(U,UU),


      OUT = cube(
		[W1,W2,W3,F4,F5,F6,F7,F8,F9],   % Front
		[X1,X2,X3,R4,R5,R6,R7,R8,R9],   % Right
		[Y1,Y2,Y3,B4,B5,B6,B7,B8,B9],   % Back
		[Z1,Z2,Z3,L4,L5,L6,L7,L8,L9],   % Left
		UU,   % Up
		D    % Down
	)  
    .   

% U' - Turn the top (up) face counter clockwise
 rotate('u',cube(
		[A1,A2,A3,F4,F5,F6,F7,F8,F9],   % Front
		[A4,A5,A6,R4,R5,R6,R7,R8,R9],   % Right
		[A7,A8,A9,B4,B5,B6,B7,B8,B9],   % Back
		[A10,A11,A12,L4,L5,L6,L7,L8,L9],   % Left
		U,   % Up
		D    % Down
	),OUT) :-
        rol_3_counter_clockwise([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12],
        [W1,W2,W3,X1,X2,X3,Y1,Y2,Y3,Z1,Z2,Z3]),
        rotate_face_counter_clockwise(U,UU),


      OUT = cube(
		[W1,W2,W3,F4,F5,F6,F7,F8,F9],   % Front
		[X1,X2,X3,R4,R5,R6,R7,R8,R9],   % Right
		[Y1,Y2,Y3,B4,B5,B6,B7,B8,B9],   % Back
		[Z1,Z2,Z3,L4,L5,L6,L7,L8,L9],   % Left
		UU,   % Up
		D    % Down
	)  
    .   

% E - Turn the horizontal slice clockwise
% other way, then on the picture
 rotate('E',cube(
		[F1,F2,F3,F4,F5,F6,F7,F8,F9],   % Front
		[R1,R2,R3,R4,R5,R6,R7,R8,R9],   % Right
		[B1,B2,B3,B4,B5,B6,B7,B8,B9],   % Back
		[L1,L2,L3,L4,L5,L6,L7,L8,L9],   % Left
		[U1,U2,U3,U4,U5,U6,U7,U8,U9],   % Up
		[D1,D2,D3,D4,D5,D6,D7,D8,D9]    % Down
	),OUT) :-
    rol_3_clockwise([F4,F5,F6,R4,R5,R6,B4,B5,B6,L4,L5,L6],[W1,W2,W3,X1,X2,X3,Y1,Y2,Y3,Z1,Z2,Z3]),
    OUT = cube(
		[F1,F2,F3,W1,W2,W3,F7,F8,F9],   % Front
		[R1,R2,R3,X1,X2,X3,R7,R8,R9],   % Right
		[B1,B2,B3,Y1,Y2,Y3,B7,B8,B9],   % Back
		[L1,L2,L3,Z1,Z2,Z3,L7,L8,L9],   % Left
		[U1,U2,U3,U4,U5,U6,U7,U8,U9],   % Up
		[D1,D2,D3,D4,D5,D6,D7,D8,D9]    % Down
	).
    
% E' - Turn the horizontal slice clockwise
% other way, then on the picture
 rotate('e',cube(
		[F1,F2,F3,F4,F5,F6,F7,F8,F9],   % Front
		[R1,R2,R3,R4,R5,R6,R7,R8,R9],   % Right
		[B1,B2,B3,B4,B5,B6,B7,B8,B9],   % Back
		[L1,L2,L3,L4,L5,L6,L7,L8,L9],   % Left
		U,   % Up
		D    % Down
	),OUT) :-
    rol_3_counter_clockwise([F4,F5,F6,R4,R5,R6,B4,B5,B6,L4,L5,L6],[W1,W2,W3,X1,X2,X3,Y1,Y2,Y3,Z1,Z2,Z3]),
    OUT = cube(
		[F1,F2,F3,W1,W2,W3,F7,F8,F9],   % Front
		[R1,R2,R3,X1,X2,X3,R7,R8,R9],   % Right
		[B1,B2,B3,Y1,Y2,Y3,B7,B8,B9],   % Back
		[L1,L2,L3,Z1,Z2,Z3,L7,L8,L9],   % Left
		U,   % Up
		D    % Down
	).



% D - Turn the bottom (down) face clockwise
% other way, then on the picture
 rotate('D',cube(
		[F1,F2,F3,F4,F5,F6,A1,A2,A3],   % Front
		[R1,R2,R3,R4,R5,R6,A4,A5,A6],   % Right
		[B1,B2,B3,B4,B5,B6,A7,A8,A9],   % Back
		[L1,L2,L3,L4,L5,L6,A10,A11,A12], 
        U,   % Up
		D    % Down
	),OUT) :-
        rol_3_clockwise([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12],
        [W1,W2,W3,X1,X2,X3,Y1,Y2,Y3,Z1,Z2,Z3]),
        rotate_face_counter_clockwise(D,DD),


      OUT = cube(
		[F1,F2,F3,F4,F5,F6,W1,W2,W3],   % Front
		[R1,R2,R3,R4,R5,R6,X1,X2,X3],   % Right
		[B1,B2,B3,B4,B5,B6,Y1,Y2,Y3],   % Back
		[L1,L2,L3,L4,L5,L6,Z1,Z2,Z3],   % Left
        U,   % Up
		DD    % Down
	)  
    .  
% D' - Turn the bottom (down) face clockwise
% other way, then on the picture
 rotate('d',cube(
		[F1,F2,F3,F4,F5,F6,A1,A2,A3],   % Front
		[R1,R2,R3,R4,R5,R6,A4,A5,A6],   % Right
		[B1,B2,B3,B4,B5,B6,A7,A8,A9],   % Back
		[L1,L2,L3,L4,L5,L6,A10,A11,A12], 
        U,   % Up
		D    % Down
	),OUT) :-
        rol_3_counter_clockwise([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12],
        [W1,W2,W3,X1,X2,X3,Y1,Y2,Y3,Z1,Z2,Z3]),
        rotate_face_clockwise(D,DD),
      OUT = cube(
		[F1,F2,F3,F4,F5,F6,W1,W2,W3],   % Front
		[R1,R2,R3,R4,R5,R6,X1,X2,X3],   % Right
		[B1,B2,B3,B4,B5,B6,Y1,Y2,Y3],   % Back
		[L1,L2,L3,L4,L5,L6,Z1,Z2,Z3],   % Left
        U,   % Up
		DD    % Down
	)  
    .  

% L - Turn the left face clockwise (if you were looking from the left)
rotate('L',cube(
            [A1,F2,F3,A2,F5,F6,A3,F8,F9],   % Front
            R,   % Right
            [B1,B2,A9,B4,B5,A8,B7,B8,A7],   % Back
            L,   % Left
            [A10,U2,U3,A11,U5,U6,A12,U8,U9],   % Up
            [A4,D2,D3,A5,D5,D6,A6,D8,D9]    % Down
        ), OUT):-
    rotate_face_clockwise(L,LL),
    rol_3_counter_clockwise([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12]),
    OUT = cube(
            [X1,F2,F3,X2,F5,F6,X3,F8,F9],   % Front
            R,   % Right
            [B1,B2,X9,B4,B5,X8,B7,B8,X7],   % Back
            LL,   % Left
            [X10,U2,U3,X11,U5,U6,X12,U8,U9],   % Up
            [X4,D2,D3,X5,D5,D6,X6,D8,D9]    % Down
        )
    .
% L' - Turn the left face counter clockwise (if you were looking from the left)
rotate('l',cube(
            [A1,F2,F3,A2,F5,F6,A3,F8,F9],   % Front
            R,   % Right
            [B1,B2,A9,B4,B5,A8,B7,B8,A7],   % Back
            L,   % Left
            [A10,U2,U3,A11,U5,U6,A12,U8,U9],   % Up
            [A4,D2,D3,A5,D5,D6,A6,D8,D9]    % Down
        ), OUT):-
    rotate_face_counter_clockwise(L,LL),
    rol_3_clockwise([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12]),
    OUT = cube(
            [X1,F2,F3,X2,F5,F6,X3,F8,F9],   % Front
            R,   % Right
            [B1,B2,X9,B4,B5,X8,B7,B8,X7],   % Back
            LL,   % Left
            [X10,U2,U3,X11,U5,U6,X12,U8,U9],   % Up
            [X4,D2,D3,X5,D5,D6,X6,D8,D9]    % Down
        )
    .

% R - Turn the right face clockwise (if you were looking from the right)
rotate('R',cube(
            [F1,F2,A1,F4,F5,A2,F7,F8,A3],   % Front
            R,   % Right
            [A9,B2,B3,A8,B5,B6,A7,B8,B9],   % Back
            L,   % Left
            [U1,U2,A10,U2,U5,A11,U7,U8,A12],   % Up
            [D1,D2,A4,D4,D5,A5,D7,D8,A6]    % Down
        ), OUT):-
    rotate_face_clockwise(R,RR),
    rol_3_clockwise([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12]),
    OUT = cube(
            [F1,F2,X1,F4,F5,X2,F7,F8,X3],   % Front
            RR,   % Right
            [X9,B2,B3,X8,B5,B6,X7,B8,B9],   % Back
            L,   % Left
            [U1,U2,X10,U2,U5,X11,U7,U8,X12],   % Up
            [D1,D2,X4,D4,D5,X5,D7,D8,X6]    % Down
        ).

% R' - Turn the right face counter clockwise (if you were looking from the right)
rotate('r',cube(
            [F1,F2,A1,F4,F5,A2,F7,F8,A3],   % Front
            R,   % Right
            [A9,B2,B3,A8,B5,B6,A7,B8,B9],   % Back
            L,   % Left
            [U1,U2,A10,U2,U5,A11,U7,U8,A12],   % Up
            [D1,D2,A4,D4,D5,A5,D7,D8,A6]    % Down
        ), OUT):-
    rotate_face_counter_clockwise(R,RR),
    rol_3_counter_clockwise([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12]),
    OUT = cube(
            [F1,F2,X1,F4,F5,X2,F7,F8,X3],   % Front
            RR,   % Right
            [X9,B2,B3,X8,B5,B6,X7,B8,B9],   % Back
            L,   % Left
            [U1,U2,X10,U2,U5,X11,U7,U8,X12],   % Up
            [D1,D2,X4,D4,D5,X5,D7,D8,X6]    % Down
        ).
% M - Turn the verticle slice clockwise (looking from left)
rotate('M',cube(
            [F1,A1,F3,F4,A2,F6,F7,A3,F9],   % Front
            R,   % Right
            [B1,A9,B3,B4,A8,B6,B7,A7,B9],   % Back
            L,   % Left
            [U1,A10,U3,U4,A11,U6,U7,A12,U9],   % Up
            [D1,A4,D3,D4,A5,D6,D7,A6,D9]    % Down
        ), OUT):-
    rol_3_counter_clockwise([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12]),
    OUT = cube(
            [F1,X1,F3,F4,X2,F6,F7,X3,F9],   % Front
            R,   % Right
            [B1,X9,B3,B4,X8,B6,B7,X7,B9],   % Back
            L,   % Left
            [U1,X10,U3,U4,X11,U6,U7,X12,U9],   % Up
            [D1,X4,D3,D4,X5,D6,D7,X6,D9]    % Down
        ).

% M' - Turn the verticle slice counter clockwise (looking from righleft)
rotate('m',cube(
            [F1,A1,F3,F4,A2,F6,F7,A3,F9],   % Front
            R,   % Right
            [B1,A9,B3,B4,A8,B6,B7,A7,B9],   % Back
            L,   % Left
            [U1,A10,U3,U4,A11,U6,U7,A12,U9],   % Up
            [D1,A4,D3,D4,A5,D6,D7,A6,D9]    % Down
        ), OUT):-
    rol_3_clockwise([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12]),
    OUT = cube(
            [F1,X1,F3,F4,X2,F6,F7,X3,F9],   % Front
            R,   % Right
            [B1,X9,B3,B4,X8,B6,B7,X7,B9],   % Back
            L,   % Left
            [U1,X10,U3,U4,X11,U6,U7,X12,U9],   % Up
            [D1,X4,D3,D4,X5,D6,D7,X6,D9]    % Down
        ).


%  F - Turn the front face clockwise
rotate('F',cube(
		F,   % Front
		[A4,R2,R3,A5,R5,R6,A6,R8,R9],   % Right
		B,   % Back
		[L1,L2,A12,L4,L5,A11,L7,L8,A10],   % Left
		[U1,U2,U3,U4,U5,U6,A1,A2,A3],   % Up
		[A9,A8,A7,D4,D5,D6,D7,D8,D9]    % Down
	    ),OUT) :-
    rotate_face_clockwise(F,FF),
    rol_3_counter_clockwise([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12]),
    OUT = cube(
		FF,   % Front
		[X4,R2,R3,X5,R5,R6,X6,R8,R9],   % Right
		B,   % Back
		[L1,L2,X12,L4,L5,X11,L7,L8,X10],   % Left
		[U1,U2,U3,U4,U5,U6,X1,X2,X3],   % Up
		[X9,X8,X7,D4,D5,D6,D7,D8,D9]    % Down
	    )
    . 

%  F' - Turn the front face counter clockwise
rotate('f',cube(
		F,   % Front
		[A4,R2,R3,A5,R5,R6,A6,R8,R9],   % Right
		B,   % Back
		[L1,L2,A12,L4,L5,A11,L7,L8,A10],   % Left
		[U1,U2,U3,U4,U5,U6,A1,A2,A3],   % Up
		[A9,A8,A7,D4,D5,D6,D7,D8,D9]    % Down
	    ),OUT) :-
    rotate_face_counter_clockwise(F,FF),
    rol_3_clockwise([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12]),
    OUT = cube(
		FF,   % Front
		[X4,R2,R3,X5,R5,R6,X6,R8,R9],   % Right
		B,   % Back
		[L1,L2,X12,L4,L5,X11,L7,L8,X10],   % Left
		[U1,U2,U3,U4,U5,U6,X1,X2,X3],   % Up
		[X9,X8,X7,D4,D5,D6,D7,D8,D9]    % Down
	    )
    . 


%  S - Turn the top slice clockwise
rotate('S',cube(
		F,   % Front
		[R1,A4,R3,R4,A5,R6,R7,A6,R9],   % Right
		B,   % Back
		[L1,A12,L3,L4,A11,L6,L7,A10,L9],   % Left
		[U1,U2,U3,A1,A2,A3,U7,U8,U9],   % Up
		[D1,D2,D3,A9,A8,A7,D7,D8,D9]    % Down
	    ),OUT) :-
    rol_3_counter_clockwise([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12]),
    OUT = cube(
		F,   % Front
		[R1,X4,R3,R4,X5,R6,R7,X6,R9],   % Right
		B,   % Back
		[L1,X12,L3,L4,X11,L6,L7,X10,L9],   % Left
		[U1,U2,U3,X1,X2,X3,U7,U8,U9],   % Up
		[D1,D2,D3,X9,X8,X7,D7,D8,D9]    % Down
	    )
    . 

%  S' - Turn the top slice counter-clockwise
rotate('s',cube(
		F,   % Front
		[R1,A4,R3,R4,A5,R6,R7,A6,R9],   % Right
		B,   % Back
		[L1,A12,L3,L4,A11,L6,L7,A10,L9],   % Left
		[U1,U2,U3,A1,A2,A3,U7,U8,U9],   % Up
		[D1,D2,D3,A9,A8,A7,D7,D8,D9]    % Down
	    ),OUT) :-
    rol_3_clockwise([A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12],[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12]),
    OUT = cube(
		F,   % Front
		[R1,X4,R3,R4,X5,R6,R7,X6,R9],   % Right
		B,   % Back
		[L1,X12,L3,L4,X11,L6,L7,X10,L9],   % Left
		[U1,U2,U3,X1,X2,X3,U7,U8,U9],   % Up
		[D1,D2,D3,X9,X8,X7,D7,D8,D9]    % Down
	    )
    .  

% TODO
% %  B - Turn the back face clockwise (if you are looking from the back)
% rotate('B',

% TODO
%  B' - Turn the back face counter clockwise (if you are looking from the back)
% rotate('b',


	% Cube = cube(
	% 	[F1,F2,F3,F4,F5,F6,F7,F8,F9],   % Front
	% 	[R1,R2,R3,R4,R5,R6,R7,R8,R9],   % Right
	% 	[B1,B2,B3,B4,B5,B6,B7,B8,B9],   % Back
	% 	[L1,L2,L3,L4,L5,L6,L7,L8,L9],   % Left
	% 	[U1,U2,U3,U4,U5,U6,U7,U8,U9],   % Up
	% 	[D1,D2,D3,D4,D5,D6,D7,D8,D9]    % Down
	% ).