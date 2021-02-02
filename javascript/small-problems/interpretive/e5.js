/*

Vigenere Cipher

The Vigenere Cipher encrypts alphabetic text using 
polyalphabetic substitution. It uses a series of 
Caesar Ciphers based on the letters of a keyword. 
Each letter of the keyword is treated as a shift 
value. For instance, the letter 'B' corresponds 
to a shift value of 1, and the letter 'd' 
orresponds to a shift value of 3. In other words, 
the shift value used for a letter is equal to its 
index value in the alphabet. This means that the 
letters 'a'-'z' are equivalent to the numbers 0-25. 
The uppercase letters 'A'-'Z' are also equivalent to 0-25.

examples:
  plaintext: Pineapples don't go on pizzas!
  keyword: meat

  Applying the Vigenere Cipher for each alphabetic character:
  plaintext : Pine appl esdo ntgo onpi zzas
  shift     : meat meat meat meat meat meat
  ciphertext: Bmnx mtpe qwdh zxgh arpb ldal

  result: Bmnxmtpeqw dhz'x gh ar pbldal!

vigenereCipher("Pineapples don't go on pizzas!", 'meat') // Bmnxmtpeqw dhz'x gh ar pbldal!

Inputs: message, key
outputs: encrypted message

algorithm:
  Turn the key into an array of numbers using alphabetPosition()
  turn the array of numbers into array of functions using shiftChar(shift)
  cycle through the functions during the mapping
*/



const UPPER_OFFSET = 'A'.charCodeAt(0);
const LOWER_OFFSET = 'a'.charCodeAt(0);
const ALPHABET_SIZE = 26;

function vigenereCipher(message, key) {
  let shiftFunctions = key.split('').map(alphabetPosition).map(shiftChar);
  let charIndex = 0;
  let encrypted = '';
  for (let i = 0; i < message.length; i++) {
    let functionIndex = charIndex % key.length;
    let char = message[i];
    if (/[a-z]/i.test(message[i])){
      char = shiftFunctions[functionIndex](char);
      charIndex += 1;
    }
    encrypted += char;
  }
  console.log(encrypted);
}

function alphabetPosition(letter) {
  return letter.toLowerCase().charCodeAt(0) - LOWER_OFFSET;
}

function shiftChar(shift) {
  return function(char) {
    let charCode = char.charCodeAt(0);
    let offset = /[a-z]/.test(char) ? LOWER_OFFSET : UPPER_OFFSET;
    charCode = (charCode - offset + shift) % ALPHABET_SIZE;
    return String.fromCharCode(charCode + offset);
  };
}
vigenereCipher("Pineapples don't go on pizzas!", 'meat') // Bmnxmtpeqw dhz'x gh ar pbldal!
