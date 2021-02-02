function twice(n) {
  let string = String(n);
  let lowerHalf = string.slice(0,string.length/2)
  let upperHalf = string.slice(string.length/2)
  if (lowerHalf === upperHalf && string.length % 2 === 0) {
    return n;
  } else {
    return 2 * n;
  }
}

console.log(twice(37));          // 74
console.log(twice(44));          // 44
console.log(twice(334433));      // 668866
console.log(twice(444));         // 888
console.log(twice(107));         // 214
console.log(twice(103103));      // 103103
console.log(twice(3333));        // 3333
console.log(twice(7676));        // 7676