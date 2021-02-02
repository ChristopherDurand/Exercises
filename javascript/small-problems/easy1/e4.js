let userNumber = Number(prompt("Please enter an integer greater than 0:"));
let choice = prompt('Enter "s" to compute the sum, or "p" to compute the product.');
if (choice === 's') {
  let sum = 0;
  for (let index = 1; index <= userNumber; index++) {
    sum += index;
  }
  console.log(`The sum of the integers between 1 and ${userNumber} is ${sum}.`);
} else if (choice === 'p') {
  let product = 1;
  for (let index = 1; index <= userNumber; index++) {
    product *= index;
  }
  console.log(`The product of the integers between 1 and ${userNumber} is ${product}.`);
}