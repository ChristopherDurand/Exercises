
function isBalanced(string) {
  let tally = 0;
  for (let i = 0; i < string.length; i++) {
    if (string[i] === '(') {
      tally += 1;
    } else if (string[i] === ')') {
      tally -= 1;
    }
    if (tally < 0) return false;
  }
  return tally === 0;
}

console.log(isBalanced('What (is) this?'));      
console.log(isBalanced('What is) this?'));       
console.log(isBalanced('What (is this?'));       
console.log(isBalanced('((What) (is this))?'));  
console.log(isBalanced('((What)) (is this))?')); 
console.log(isBalanced('Hey!'));                 
console.log(isBalanced(')Hey!('));               
console.log(isBalanced('What ((is))) up('));     