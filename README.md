# Conway's Game of Life
<br>

## Short description of the project

A simulator for Conway’s Game of Life, which initializes a matrix-based grid, takes user inputs to define live cells,
and iteratively applies rules to evolve the grid. Finally, it prints the resulting matrix configuration, showing live and
dead cells after evolution. The code demonstrates direct memory manipulation, conditional branching, and efficient
looping in Assembly x86.

<br>


## Overview

Conway's Game of Life is a two-dimensional zero-player game invented by mathematician John Horton Conway in 1970. The purpose of this game is to observe the evolution of a system of cells, starting from an initial configuration, by introducing rules governing the death and creation of new cells in the system. This evolutionary system is Turing-complete.

The state of a system is described by the cumulative state of its component cells, governed by the following rules:

1. **Underpopulation**
   - Any cell (alive in the current generation) with fewer than two live neighbors dies in the next generation.

2. **Survival of living cells**
   - Any cell (alive in the current generation) with two or three live neighbors survives to the next generation.

3. **Overpopulation**
   - Any cell (alive in the current generation) with more than three live neighbors dies in the next generation.

4. **Reproduction**
   - A dead cell with exactly three live neighbors becomes alive in the next generation.

5. **Continuation of dead cells**
   - Any other dead cell, not fitting the reproduction rule, remains dead.

## Neighbor Definition

The neighbors of a cell are the 8 adjacent cells in a two-dimensional matrix.


```
00          01          02
10    current cell      12
20          21          22
```



## System State Representation

The state of the system at generation `n` is represented by a matrix `Sn` where: `Sn` ∈ M m×n({0,1}) ( `m` - number of lines, `n` - number of colons), 0 represents a dead cell, 1 represents a living cell (in the current generation). We define `k-evolution` (k≥0) an iteration `S0` → `S1` → ··· → `Sk`, where every `S(i+1)` is derived from `Si`, by applying the rules listed above.



## Special Cases for Edge Cells

For cells located on the first row, first column, last row, or last column, neighbors outside the matrix are considered as dead.



## Example

### Initial Configuration (`S0`)

```
0 1 1 0
1 0 0 0
0 0 1 1
```

To handle edge cases, the `3x4` matrix is extended to a `5x6` matrix:

```
0 0 0 0 0 0
0 0 1 1 0 0
0 1 0 0 0 0
0 0 0 1 1 0
0 0 0 0 0 0
```



### Applying Evolution Rules

Each cell in the main matrix is processed according to the rules:

- **Cell (0,0)**: Dead with fewer than 3 live neighbors → remains dead (Rule 5).
- **Cell (0,1)**: Alive with exactly 2 live neighbors → survives (Rule 2).
- **Cell (0,2)**: Alive with only 1 live neighbor → dies (Rule 1).

Following this logic, the system evolves into the following configuration for `S1`.

```
0 0 0 0 0 0
0 0 1 0 0 0
0 0 0 0 1 0
0 0 0 0 0 0
0 0 0 0 0 0
```

<br>

## Note

### 142_Opran_Andrei_0.s takes input from the keyboard, and 142_Opran_Andrei_2.s takes input from a file.
