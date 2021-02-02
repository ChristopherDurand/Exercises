function charToDigit(char) {
  let DIGITS = "0123456789";
  return DIGITS.indexOf(char);
}

function charsToBase(n) {
  return function(acc, digit, index) {
    return acc + digit * (n ** index);
  };
}

function octalToDecimal(numberString) {
  return numberString
        .split("")
        .map(charToDigit)
        .reverse()
        .reduce(charsToBase(8));
}

console.log(octalToDecimal('1'));           // 1
console.log(octalToDecimal('10'));          // 8
console.log(octalToDecimal('130'));         // 88
console.log(octalToDecimal('17'));          // 15
console.log(octalToDecimal('2047'));        // 1063
console.log(octalToDecimal('011'));         // 9