function isUppercase(string) {
  return string.match(/[a-zA-Z]/g).every(c => c.toUpperCase() === c);
}

// More Sussinct:

function isUpperCase(string) {
  return !/[a-z]/.test(string);
}

//


isUppercase('t');               // false
isUppercase('T');               // true
isUppercase('Four Score');      // false
isUppercase('FOUR SCORE');      // true
isUppercase('4SCORE!');         // true
isUppercase('');                // true