% Takes in cube(F,R,B,L,U,D) and prints it out in correct format
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
	format('~w~w~w\n',[D7,D8,D9])
	.

% Reads in input and parses it into my cube struct cube(F,R,B,L,U,D)
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

% Check if cube is solved (all sides are solved)
solved_cube(cube(F,R,B,L,U,D)) :-
    maplist(solved_side, [F,R,B,L,U,D]).


% all the different moves
moves(['U','u','D','d','R','r','L','l','F','f','M','m','E','e','S','s','B','b']).


% Apply first rotation from list, and call itself again, until all the rotations are done
apply_moves([], Cube, Cube).
apply_moves([Move|T], OldCube, NewCube) :-
    rotate(Move, OldCube, TmpCube),
    apply_moves(T, TmpCube, NewCube).



% Generates move sequence of given length (Depth).
generate_single_move_sequence(0, []).
generate_single_move_sequence(Depth, [Move | Rest]) :-
    Depth > 0,
    moves(Moves),
    member(Move, Moves),
    PrevDepth is Depth - 1,
    generate_single_move_sequence(PrevDepth, Rest).

% % Takes in the initial cube, and max depth
% % For every depth, generate all possible moves orders(Paths)
% % Rotate the initial cube to check all those paths, if any of them is solution, return the path
% % otherwise increase the CurrentDepth
iterative_deepening_search(Cube, MaxDepth, SolutionPath) :-
    between(0, MaxDepth, CurrentDepth),
    generate_single_move_sequence(CurrentDepth, Path),
    apply_moves(Cube, Path, RotatedCube),
    ( solved_cube(RotatedCube) ->
        SolutionPath = Path
    ).


% Takes in Cube and path (in the right order already),
% and it prints the cube and rotates it, until it is solved.
print_output(Cube,[]):-print_cube(Cube).
print_output(Cube,[H|T]):-
	print_cube(Cube),
	write('\n'),
	rotate(H,Cube,RotatedCube),
	print_output(RotatedCube,T).

main :- 
	% load in cube
	parse_input(Cube),

	% find solution
	iterative_deepening_search(Cube,10,SolutionPath),
	
	% Print the output in correct format with the intermediate steps
	print_output(Cube,SolutionPath)
	.