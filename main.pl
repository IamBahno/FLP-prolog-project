:- dynamic seen_cube/1.

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
	( seen_cube(RotatedCube) ->
        try_paths(Rest, CubeIn, SolvedPath)
    ;   assertz(seen_cube(RotatedCube)),
        ( solved_cube(RotatedCube) ->
            SolvedPath = Path
        ;
            try_paths(Rest, CubeIn, SolvedPath)
        )
    )
	.

% This BFS case catches the first call, where the are none paths yet
bfs_loop([], Cube, SolvedPath) :-
	extend_path([], ExtendedPaths),
	(	try_paths(ExtendedPaths,Cube,SolvedPath)

    ;
        append([], ExtendedPaths, NewQueue),
        bfs_loop(NewQueue, Cube, SolvedPath)
    ).
% The main bfs loop, takes in, a queue of paths, and the initial loaded cube
% Pops the first path from the queue, and generate the new 18 paths
% Check if any of them are solved cube, if so returns the solved path,
% otherwise append the new paths to the queue, and recursivley calls it self
bfs_loop([Path|RestQueue], Cube, SolvedPath) :-
	% write(Path),
	% write('\n'),

    % apply_path_to(Cube, Path, NewCube),
	extend_path(Path, ExtendedPaths),
	(	try_paths(ExtendedPaths,Cube,SolvedPath)

    ;
        append(RestQueue, ExtendedPaths, NewQueue),
        bfs_loop(NewQueue, Cube, SolvedPath)
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
	parse_input(Cube),


    (   solved_cube(Cube) ->
        % write('Cube is already solved.'), nl,
        print_cube(Cube)
    ;
        bfs_loop([], Cube, SolvedPath)
        % write('Solved path: '), write(SolvedPath), nl
    ),

    reverse(SolvedPath, OrderedMoves),
	print_output(Cube,OrderedMoves)
	% apply_path_to(Cube,SolvedPath,CubeOut),

	% print_cube(CubeOut)
	.


% TODO testing