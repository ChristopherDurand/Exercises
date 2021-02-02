/*

Diamonds
Write a function that displays a 4 pointed diamond in an nxn grid, where n is an
odd integer supplied as an argument to the function. it will always be odd.

Input
  Odd Integer

Output
  Diamond logged to the console

Examples

diamond(1);
*

diamond(3);
 *
***
 *

diamond(9);
    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

Rules:
  Always given an odd number m = 2n+1
  Prepended spaces for 9 = 2n+1 => n = 4:
  [4, 3, 2, 1, 0, 1, 2, 3, 4] => [abs(n-i)] for i 0...m, called ps
  Stars for m = 9, n = 4;
  [1, 3, 5, 7, 9, 7, 5, 3, 1] => [m - 2*ps[i]]

Algorithm
  Given an odd number m of the form 2n+1, n = (m-1)/2.
  Build the prepended spaces array.
    [abs(n-i)] for i 0...m, called ps
  Using the prepended spaces array as ps, build the stars array.
    [m - 2*ps[i]] for i 0...m
  Walk along the arrays, prepending spaces and then printing stars.
*/

function diamond(m) {
  let n = (m - 1) / 2;
  let prependedSpaces = [];
  let stars = [];
  for (let i = 0; i < m; i++) {
    prependedSpaces[i] = Math.abs(n - i);
    stars[i] = m - 2 * prependedSpaces[i];
  }
  for (let i = 0; i < m; i++) {
    let space = ' '.repeat(prependedSpaces[i]);
    let star = '*'.repeat(stars[i]);
    console.log(space + star);
  }
}

function hollowDiamond(m) {
  let n = (m - 1) / 2;
  let prependedSpaces = [];
  let stars = [];
  for (let i = 0; i < m; i++) {
    prependedSpaces[i] = Math.abs(n - i);
    stars[i] = m - 2 * prependedSpaces[i];
  }
  for (let i = 0; i < m; i++) {
    let space = ' '.repeat(prependedSpaces[i]);
    let star;
    if (stars[i] > 1) {
      star = '*' + ' '.repeat(stars[i] - 2) + '*';
    } else {
      star = '*'.repeat(stars[i]);
    }
    console.log(space + star);
  }
}

hollowDiamond(1);
hollowDiamond(3); 
hollowDiamond(9);