/*

Luhn Formula.

It is a formula used to verify credit card numbers and canadian SINs.

Here is the formula as stated in the problem:
  Counting from the rightmost digit and moving left, double the value of every second digit.
  If it becomes more than 10, subtract 9.
  Add the digits together.
  It is valid if the checksum ends in 0.

Inputs:
  a string of numbers that may contain non-digits

Outputs:
  boolean T/F

Data Structure-
  Input is a string of characters.
  Represent internally as an array of Numbers.
  Output becomes a Boolean.

Algorithm.
  Use a RegExp to filter the string to an array of digit characters.
  Reverse the array.
  Map those digit characters to numbers.
  Map every second digit to double, and subtract 9 if they become greater than 9.
  Reduce the numbers to a sum.
  return the result of sum % 10 === 0.
*/

function luhn(inputString) {
  let numbers = inputString.match(/\d/g).map(Number).reverse();
  let checkSum = numbers.map((number, index) => {
    if (index % 2 === 1) {
      return number * 2 - (number >= 5 ? 9 : 0);
    } else {
      return number;
    }
  }).reduce((total, value) => total + value);
  return checkSum % 10 === 0;
}




console.log(luhn("2323 2005 7766 3554"));  // true
console.log(luhn('1111'));                 // false
console.log(luhn('8763'));