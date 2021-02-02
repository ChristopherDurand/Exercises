function findFibonacciIndexByLength(n) {
  let index = 2;
  let fiba = 1;
  let fibb = 1;
  while (String((fiba)) < n) {
    [fiba, fibb] = [fiba + fibb, fiba]
    index += 1;
  }
  return index;
}

findFibonacciIndexByLength(2);       // 7
findFibonacciIndexByLength(10);      // 45
findFibonacciIndexByLength(16);    