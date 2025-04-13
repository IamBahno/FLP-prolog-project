
print_cube(cube(
		[F1,F2,F3,F4,F5,F6,F7,F8,F9],   % Front
		[R1,R2,R3,R4,R5,R6,R7,R8,R9],   % Right
		[B1,B2,B3,B4,B5,B6,B7,B8,B9],   % Back
		[L1,L2,L3,L4,L5,L6,L7,L8,L9],   % Left
		[U1,U2,U3,U4,U5,U6,U7,U8,U9],   % Up
		[D1,D2,D3,D4,D5,D6,D7,D8,D9]    % Down
	)) :-
	format('~w~w~w\n',[U1,U2,U3]),
	format('~w~w~w\n',[U4,U5,U6]),
	format('~w~w~w\n',[U7,U8,U9]),
	format('~w~w~w ',[F1,F2,F3]),format('~w~w~w ',[R1,R2,R3]),format('~w~w~w ',[B1,B2,B3]),format('~w~w~w\n',[L1,L2,L3]),
	format('~w~w~w ',[F4,F5,F6]),format('~w~w~w ',[R4,R5,R6]),format('~w~w~w ',[B4,B5,B6]),format('~w~w~w\n',[L4,L5,L6]),
	format('~w~w~w ',[F7,F8,F9]),format('~w~w~w ',[R7,R8,R9]),format('~w~w~w ',[B7,B8,B9]),format('~w~w~w\n',[L7,L8,L9]),
	format('~w~w~w\n',[D1,D2,D3]),
	format('~w~w~w\n',[D4,D5,D6]),
	format('~w~w~w',[D7,D8,D9])
	.

parse_input(Cube) :-
	read_lines(Lines),    
    split_lines(Lines, S),
	S = [[[U1,U2,U3]],
		 [[U4,U5,U6]],
		 [[U7,U8,U9]],
		 [[F1,F2,F3],[R1,R2,R3],[B1,B2,B3],[L1,L2,L3]],
		 [[F4,F5,F6],[R4,R5,R6],[B4,B5,B6],[L4,L5,L6]],
		 [[F7,F8,F9],[R7,R8,R9],[B7,B8,B9],[L7,L8,L9]],
		 [[D1,D2,D3]],
		 [[D4,D5,D6]],
		 [[D7,D8,D9]]
	],
	Cube = cube(
		[F1,F2,F3,F4,F5,F6,F7,F8,F9],   % Front
		[R1,R2,R3,R4,R5,R6,R7,R8,R9],   % Right
		[B1,B2,B3,B4,B5,B6,B7,B8,B9],   % Back
		[L1,L2,L3,L4,L5,L6,L7,L8,L9],   % Left
		[U1,U2,U3,U4,U5,U6,U7,U8,U9],   % Up
		[D1,D2,D3,D4,D5,D6,D7,D8,D9]    % Down
	).


% Takes in a side (list), and returns if all the values are same. 
solved_side([]).
solved_side([_]). 
solved_side([X,X|T]):- solved_side([X|T]). 

% Check if cube is solved
solved_cube(cube(F,R,B,L,U,D)) :-
    maplist(solved_side, [F,R,B,L,U,D]).

main :- 
	parse_input(Cube),
	% solved_cube(Cube),
	rotate('l',Cube,NewCube),
	print_cube(NewCube)
    .


% The plan is to create a queue, where i will append moves, already done,
% so i would start with empty list, and first i would i would try all 18, locations, if none of them would solve it,
% i would add the rotations, ['U','U'','D',...],
% then i would pop of first, try 18 rotations, if nothing i would append them again, ['U'','D',....'UU','UU'','UD'....]
% i can add like optimalization that i would i cannot add same rotations behind each other like U and U'
% or maybe keep list of already visited paths, or cubes itsealf (or hashes of them)