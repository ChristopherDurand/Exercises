/*

Caesar Cipher
  
Inputs: a message to be encoded and an integer representing a shift

Outputs: an encrypted message

Rules:
  Letters will be shifted to the right within the alphabet.
  For example, with shift = 4;
  ABCDEFGHIJKLMNOPQRSTUVWXYz
=>EFGHIJKLMNOPQRSTUVWXYZABCD
  it wraps around.

Test Cases:
// simple shift
caesarEncrypt('A', 0);       // "A"
caesarEncrypt('A', 3);       // "D"

// wrap around
caesarEncrypt('y', 5);       // "d"
caesarEncrypt('a', 47);      // "v"

// all letters
caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25);
// "ZABCDEFGHIJKLMNOPQRSTUVWXY"
caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5);
// "Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!"

// many non-letters
caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2);
// "Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?"

algorithm for caeserEncrypt
  input: string message, int shift
  run replacement on string, replace all letters with the shifted version
  return message

algorithm for shiftChar
  Turn letter into char code, and subtract the code for A or a to get the alphabet index
  add shift to the index, and use modular arithmetic to wrap around
  add back the code for A or a to get back to the case we had
  turn the char code back into a character and return it 
*/
const UPPER_OFFSET = 'A'.charCodeAt(0);
const LOWER_OFFSET = 'a'.charCodeAt(0);
const ALPHABET_SIZE = 26;

function shiftChar(shift) {
  return function(char) {
    let charCode = char.charCodeAt(0);
    let offset = /[a-z]/.test(char) ? LOWER_OFFSET : UPPER_OFFSET;
    charCode = (charCode - offset + shift) % ALPHABET_SIZE;
    return String.fromCharCode(charCode + offset);
  };
}

function caesarEncrypt(message, shift) {
  console.log(message.replace(/[a-z]/gi, shiftChar(shift)));
}

// Test Cases:
// simple shift
caesarEncrypt('A', 0);       // "A"
caesarEncrypt('A', 3);       // "D"

// wrap around
caesarEncrypt('y', 5);       // "d"
caesarEncrypt('a', 47);      // "v"

// all letters
caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25);
// "ZABCDEFGHIJKLMNOPQRSTUVWXY"
caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5);
// "Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!"

// many non-letters
caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2);
// "Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?"

