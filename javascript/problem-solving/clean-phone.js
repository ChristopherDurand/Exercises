/*

Inputs: a string that contains digits, and formatting characters.

Outputs: 10 digits.

Rules
  Numbers with less than 10 digits are ignored.
  Numbers with 10 digits are assumed good.
  If the number has 11 digits - 
    If the first digit is 1, ignore it, and use the rest of the number.
    Otherwise, it is bad.
  More than 11 digits is a bad number.
  Bad numbers become ten zeros.

Data Structure
  Represent the input as a string.
  Represent the number internally as an array of characters.
  Output is a string.

Algorithm.
  Filter the input string to only contain digits.
  If it has less than 10 digits or more than 11, fail.
  If it has exactly 11 and the first digit is not a 1, fail.
  If it has exactly 11 and the first digit is 1, trim.

Test Cases.
cleanPhoneNumber('123-234-4494') // '1232344494'
cleanPhoneNumber('(123)-234-4494') // '1232344494'
cleanPhoneNumber('123.234.4494') // '1232344494'
cleanPhoneNumber('23-234-4494') // '0000000000'
cleanPhoneNumber('23-234-449-55-424') // '0000000000'
cleanPhoneNumber('1 - 123-234-4494') // '1232344494'
cleanPhoneNumber('2 - 123-234-4494') // '0000000000'

*/

function cleanPhoneNumber(number){
  let result = number.match(/\d/g);
  if (result.length < 10 || result.length > 11) return '0000000000';
  if (result.length === 11){
    if(result[0] !== '1') return '0000000000';
    result.shift();
  }
  return result.join('');
}


console.log(cleanPhoneNumber('123-234-4494')); // '1232344494'
console.log(cleanPhoneNumber('(123)-234-4494')); // '1232344494'
console.log(cleanPhoneNumber('123.234.4494')); // '1232344494'
console.log(cleanPhoneNumber('23-234-4494')); // '0000000000'
console.log(cleanPhoneNumber('23-234-449-55-424')); // '0000000000'
console.log(cleanPhoneNumber('1 - 123-234-4494')); // '1232344494'
console.log(cleanPhoneNumber('2 - 123-234-4494')); // '0000000000'
