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
            [A4,B2,B3,A5,B5,B6,A6,B8,B9],   % Back
            L,   % Left
            [A7,U2,U3,A8,U5,U6,A9,U8,U9],   % Up
            [A10,D2,D3,A11,D5,D6,A12,D8,D9]    % Down
        ), OUT):-
    rotate_face_clockwise(L,LL),
    OUT = cube(
            [A7,F2,F3,A8,F5,F6,A9,F8,F9],   % Front
            R,   % Right
            [A10,B2,B3,A11,B5,B6,A12,B8,B9],   % Back
            LL,   % Left
            [A4,U2,U3,A5,U5,U6,A6,U8,U9],   % Up
            [A1,D2,D3,A2,D5,D6,A3,D8,D9]    % Down
        )
    .
% L' - Turn the left face counter clockwise (if you were looking from the left)
rotate('l',cube(
            [A1,F2,F3,A2,F5,F6,A3,F8,F9],   % Front
            R,   % Right
            [A4,B2,B3,A5,B5,B6,A6,B8,B9],   % Back
            L,   % Left
            [A7,U2,U3,A8,U5,U6,A9,U8,U9],   % Up
            [A10,D2,D3,A11,D5,D6,A12,D8,D9]    % Down
        ), OUT):-
    rotate_face_counter_clockwise(L,LL),
    OUT = cube(
            [A10,F2,F3,A11,F5,F6,A12,F8,F9],   % Front
            R,   % Right
            [A7,B2,B3,A8,B5,B6,A9,B8,B9],   % Back
            LL,   % Left
            [A1,U2,U3,A2,U5,U6,A3,U8,U9],   % Up
            [A4,D2,D3,A5,D5,D6,A6,D8,D9]    % Down
        )
    .

% R - Turn the right face clockwise (if you were looking from the right)
rotate('R',cube(
            [F1,F2,A1,F4,F5,A2,F7,F8,A3],   % Front
            R,   % Right
            [B1,B2,A4,B4,B5,A5,B7,B8,A6],   % Back
            L,   % Left
            [U1,U2,A7,U2,U5,A8,U7,U8,A9],   % Up
            [D1,D2,A10,D4,D5,A11,D7,D8,A12]    % Down
        ), OUT):-
    rotate_face_clockwise(R,RR),
    OUT = cube(
            [F1,F2,A10,F4,F5,A11,F7,F8,A12],   % Front
            RR,   % Right
            [B1,B2,A7,B4,B5,A8,B7,B8,A9],   % Back
            L,   % Left
            [U1,U2,A1,U2,U5,A2,U7,U8,A3],   % Up
            [D1,D2,A4,D4,D5,A5,D7,D8,A6]    % Down
        )
    .

% R' - Turn the right face counter clockwise (if you were looking from the right)
rotate('r',cube(
            [F1,F2,A1,F4,F5,A2,F7,F8,A3],   % Front
            R,   % Right
            [B1,B2,A4,B4,B5,A5,B7,B8,A6],   % Back
            L,   % Left
            [U1,U2,A7,U2,U5,A8,U7,U8,A9],   % Up
            [D1,D2,A10,D4,D5,A11,D7,D8,A12]    % Down
        ), OUT):-
    rotate_face_counter_clockwise(R,RR),
    OUT = cube(
            [F1,F2,A7,F4,F5,A8,F7,F8,A9],   % Front
            RR,   % Right
            [B1,B2,A10,B4,B5,A11,B7,B8,A12],   % Back
            L,   % Left
            [U1,U2,A4,U2,U5,A5,U7,U8,A6],   % Up
            [D1,D2,A1,D4,D5,A2,D7,D8,A3]    % Down
        )
    .

	% Cube = cube(
	% 	[F1,F2,F3,F4,F5,F6,F7,F8,F9],   % Front
	% 	[R1,R2,R3,R4,R5,R6,R7,R8,R9],   % Right
	% 	[B1,B2,B3,B4,B5,B6,B7,B8,B9],   % Back
	% 	[L1,L2,L3,L4,L5,L6,L7,L8,L9],   % Left
	% 	[U1,U2,U3,U4,U5,U6,U7,U8,U9],   % Up
	% 	[D1,D2,D3,D4,D5,D6,D7,D8,D9]    % Down
	% ).