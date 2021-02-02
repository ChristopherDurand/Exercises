let age = Number(prompt("What is your age?"));
let retirementAge = Number(prompt("At what age would you like to retire?"));
let year = (new Date()).getFullYear();

console.log(`It's ${year}. You will retire in ${year + retirementAge - age}.`)
console.log(`You only have ${retirementAge - age} years of work to go!`)