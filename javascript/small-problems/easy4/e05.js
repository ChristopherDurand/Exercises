function interleave(a, b) {
  let result = [];
  for (i = 0; i < a.length; i+=1) {
    result.push(a[i],b[i]);

  }
  return result;
}


console.log(interleave([1, 2, 3], ['a', 'b', 'c']));    // [1, "a", 2, "b", 3, "c"]