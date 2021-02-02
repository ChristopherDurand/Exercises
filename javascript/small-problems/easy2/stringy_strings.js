function stringy(n) {
  let CONTENT = ['1','0']
  let result = "";
  for (let i = 0; i < n; i++ ) {
    result += CONTENT[i % 2];
  }
  return result;
}

console.log(stringy(6));    // "101010"
console.log(stringy(9));    // "101010101"
console.log(stringy(4));    // "1010"
console.log(stringy(7));    // "1010101"