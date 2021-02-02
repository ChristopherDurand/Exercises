const SQMETERS_TO_SQFEET = 10.7639;
let length = parseInt(prompt("Enter the length of the room in meters:"), 10)
let width = parseInt(prompt("Enter the width of the room in meters:"), 10)

let squareMeters = length * width;
let squareFeet = squareMeters * SQMETERS_TO_SQFEET;

console.log(`The area of the room is ${squareMeters.toFixed(2)} (${squareFeet.toFixed(2)} square feet).`)


