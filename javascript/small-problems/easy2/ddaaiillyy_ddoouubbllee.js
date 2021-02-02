function crunch(string) {
  let result = '';
  for (let i = 0; i < string.length; i++) {
    if (string[i] === string[i-1]) continue;
    result += string[i];
  }
  return result;
}

function crunch(string) {
}

console.log(crunch('ddaaiillyy ddoouubbllee'));    // "daily double"
console.log(crunch('4444abcabccba'));              // "4abcabcba"
console.log(crunch('ggggggggggggggg'));            // "g"
console.log(crunch('a'));                          // "a"
console.log(crunch(''));   