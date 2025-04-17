
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

% pop from front of the queue
queue_pop([H|T], H, T).


% all the different moves
moves(['U','u','D','d','R','r','L','l','F','f','M','m','E','e','S','s']).

% just reverse the path, and apply the rotations to the Cube
apply_path_to(CubeIn,Path, CubeOut) :-
    reverse(Path, OrderedMoves),
    apply_moves(OrderedMoves, CubeIn, CubeOut).

% Apply first rotation from list, and call itself again, until all the rotations are done
apply_moves([], Cube, Cube).
apply_moves([Move|T], OldCube, NewCube) :-
    rotate(Move, OldCube, TmpCube),
    apply_moves(T, TmpCube, NewCube).

% % Taks in cube and list of paths, apply all the path rotations seperatly, creatign N cubes
% apply_path_to_list(CubeIn, Paths, CubesOut) :-
%     % For each Path in Paths, apply apply_path_to(CubeIn, Path, CubeOut), (fixxing the CubeIn as first argument)
%     maplist(apply_path_to(CubeIn), Paths, CubesOut).

extend_path(Path, NewPaths) :-
    moves(Moves),
    findall([Move|Path], member(Move, Moves), NewPaths).

% Try each path, apply it to the cube, and succeed if the resulting cube is solved
try_paths([], _, _) :- fail.
try_paths([Path|Rest], CubeIn, SolvedPath) :-
    apply_path_to(CubeIn, Path, RotatedCube),
    ( solved_cube(RotatedCube) ->
        SolvedPath = Path
    ;
        try_paths(Rest, CubeIn, SolvedPath)
    ).

bfs_loop([], Cube, SolvedPath) :-
	extend_path([], ExtendedPaths),
	(	try_paths(ExtendedPaths,Cube,SolvedPath)

    ;
        append([], ExtendedPaths, NewQueue),
        bfs_loop(NewQueue, Cube, SolvedPath)
    ).

bfs_loop([Path|RestQueue], Cube, SolvedPath) :-
    % apply_path_to(Cube, Path, NewCube),
	extend_path(Path, ExtendedPaths),
	(	try_paths(ExtendedPaths,Cube,SolvedPath)

    ;
        append(RestQueue, ExtendedPaths, NewQueue),
        bfs_loop(NewQueue, Cube, SolvedPath)
    ).

main :- 
	parse_input(Cube),


    (   solved_cube(Cube) ->
        write('Cube is already solved.'), nl,
        print_cube(Cube)
    ;
        bfs_loop([], Cube, SolvedPath),
        write('Solved path: '), write(SolvedPath), nl
    ),
	apply_path_to(Cube,SolvedPath,CubeOut),
	print_cube(CubeOut)
	.

% The plan is to create a queue, where i will append moves, already done,
% so i would start with empty list, and first i would i would try all 18, locations, if none of them would solve it,
% i would add the rotations, ['U','u','D',...],
% then i would pop of first, try 18 rotations, if nothing i would append them again, ['u','D',....'UU','Uu','UD'....]
% i can add like optimalization that i would i cannot add same rotations behind each other like U and U'
% or maybe keep list of already visited paths, or cubes itsealf (or hashes of them)

% TODO finish the B rotations, add B rotatiosn back to the list of moves