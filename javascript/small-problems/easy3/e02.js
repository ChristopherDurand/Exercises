let numbers = [];
numbers[0] = prompt("Enter the 1st number:")
numbers[1] = prompt("Enter the 2nd number:")
numbers[2] = prompt("Enter the 3rd number:")
numbers[3] = prompt("Enter the 4th number:")
numbers[4] = prompt("Enter the 5th number:")
let last  = prompt("Enter the last number:")

if (numbers.includes(last)) {
  console.log(`The number ${last} appears in [${numbers.join(", ")}].`)
} else {
  console.log(`The number ${last} does not appear in [${numbers.join(", ")}].`)
}
