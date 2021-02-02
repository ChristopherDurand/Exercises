

function showMultiplicativeAverage(numbers) {
  let product = numbers.reduce((prod, val) => prod * val);
  let average = product / numbers.length;
  return String(average.toFixed(3));
}


console.log(showMultiplicativeAverage([3, 5]));                   // "7.500"
console.log(showMultiplicativeAverage([2, 5, 7, 11, 13, 17]));    // "28361.667"