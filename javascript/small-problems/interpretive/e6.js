/*

Seeing Stars

Create a function that displays an 8 pointed star in 
an nxn grid, where n is an odd integer.
The smallest will be n = 7.

Rules:
  We have to log: 
    Horizontal, 
    Vertical, 
    Forward Diagonal, 
    Backward Diagonal

Examples:
  star(9);
  // logs
  *   *   *
   *  *  *
    * * *
     ***
  *********
     ***
    * * *
   *  *  *
  *   *   *
  star(7);
  // logs
  *  *  *
   * * *
    ***
  *******
    ***
   * * *
  *  *  *

Data Structures:
  Represent the grid as a 2d array of spaces. 
    initialize to an array of n arrays with n spaces.

Algorithm:
  Given an odd number m of the form 2n+1, where n = (m - 1) / 2:
  Initialize the grid to spaces.
  Set Vertical: 
    Set grid[x, y] where x = n;
  Set Horizontal:
    Set grid[x, y] where y = n;
  Set Backward Diagonal:
    Set grid[x, y] where x = y;
  Set Forward Diagonal:
    Set grid[x, y] where x = m - y;
  Print the grid.
*/

function initializeGrid(m) {
  let grid = [];
  for (let i = 0; i < m; i++) {
    grid.push([]);
    for (let j = 0; j < m; j++) {
      grid[i][j] = ' ';
    }
  }
  return grid;
}

function star(m) {
  let n = (m - 1) / 2;
  let grid = initializeGrid(m);
  for (let i = 0; i < m; i ++) {
    grid[i][n] = '*';
    grid[n][i] = '*';
    grid[i][i] = '*';
    grid[m-i-1][i] = '*';
  }
  grid.forEach(line => console.log(line.join('')));
}

star(9);

star(7);