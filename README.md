# FLP Prolog Project — Rubik's Cube Solver

**School Year:** 2024/25  
**Login:** `xbahou00`  
**Author:** Ondřej Bahnounek

---

## 🧠 Solution

The Rubik’s cube is represented using the following predicate:

```prolog
cube([F1,F2,F3,F4,F5,F6,F7,F8,F9],   % Front
     [R1,R2,R3,R4,R5,R6,R7,R8,R9],   % Right
     [B1,B2,B3,B4,B5,B6,B7,B8,B9],   % Back
     [L1,L2,L3,L4,L5,L6,L7,L8,L9],   % Left
     [U1,U2,U3,U4,U5,U6,U7,U8,U9],   % Up
     [D1,D2,D3,D4,D5,D6,D7,D8,D9]    % Down
)
```
Each face of the cube contains 9 values, where each value is a number from 1 to 6 representing a color.

This representation allows convenient access to individual pieces as well as entire faces. I can shorten the notation to `cube(F, R, B, L, U, D)` when working with whole faces.


#### Algorithm: Iterative Deepening Search (IDS)
I used Iterative Deepening Search (IDS) to explore the solution space efficiently.

The algorithm works by setting a MaxDepth limit and then iteratively increasing the depth at which the cubes are explored. For each depth `D`, i generates all possible sequences of moves of length `D`, applies each move sequence to the input cube, and checks whether the resulting cube is solved.

If a solution is found, the corresponding sequence of moves is returned.

#### Efficiency
This approach is very memory-efficient, as nothing is stored in memory — neither intermediate cubes nor move sequences. Surprisingly, the performance is even better than BFS in practice.

While IDS requires performing `D` rotations of the original cube for each move sequence of length `D` (at depth `D`), compared to just one rotation of the parent cube in BFS, the rotations themselves are not computationally expensive. In contrast, managing a large number of cubes in memory, as BFS does, introduces significant overhead.

#### No Tree Structure
Technically, I don’t even use a tree structure. Instead, I directly explore all the possible move sequences of a given length. This eliminates the need to expand nodes at intermediate levels, as is typically done in a traditional IDS implementation.



---

## 📁 Files

- `rotations.pl` — Contains all 18 cube rotations and helper functions.
- `main.pl` — Contains the main logic for solving the cube, input parsing and output printing.
- `test_inputs/` — Folder with prepared test input files.
- `input2.pl` — Library for I/O. 
- `Makefile` — Makefile

---

## ⚙️ Build & Run

To build the project:

```bash
make

./flp24-log < in.txt > out.txt
```

## 🧪 Testing
Test inputs are provided in the test_inputs folder.

You can measure execution time using the time command:
```bash
time ./flp24-log < test_inputs/1move.txt > out.txt
```



## ⏱️ Performance
Measured at Merlin

| Depth (Moves) | Time       | Command                                                  |
|---------------|------------|----------------------------------------------------------|
| 1             | 0m0.029s   | `./flp24-log < test_inputs/1move.txt > out.txt`          |
| 2             | 0m0.032   | `./flp24-log < test_inputs/2moves.txt > out.txt`         |
| 3             | 0m0.044s   | `./flp24-log < test_inputs/3moves.txt > out.txt`         |
| 4             | 0m0.332s   | `./flp24-log < test_inputs/4moves.txt > out.txt`         |
| 5             | 0m3.640s   | `./flp24-log < test_inputs/5moves.txt > out.txt`         |
| 6             | 2m5.085s  | `./flp24-log < test_inputs/6moves.txt > out.txt`         |
| 7             | 31m0.775s | `./flp24-log < test_inputs/7moves.txt > out.txt`         |
