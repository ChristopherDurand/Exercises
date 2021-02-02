function sequence(n) {
  let result = [];
  for(let i = 1; i <= n; i ++) {
    result.push(i);
  }
  console.log(result);
}

sequence(5);    // [1, 2, 3, 4, 5]
sequence(3);    // [1, 2, 3]
sequence(1);    // [1]
