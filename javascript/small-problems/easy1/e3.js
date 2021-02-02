let cost = parseInt(prompt("What is the bill?"),10);
let tip = parseInt(prompt("What is the tip percentage?"),10);

console.log(`The tip is \$${(cost * tip).toFixed(2)}`)
console.log(`The total is \$${(cost * (1 + tip)).toFixed(2)}`)
