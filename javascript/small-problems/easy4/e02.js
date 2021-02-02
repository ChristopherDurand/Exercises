function union(a, b) {
  let aNotB = a.filter(e => !b.includes(e));
  return [...aNotB, ...b];
}

console.log(union([1, 3, 5], [3, 6, 9]));    // [1, 3, 5, 6, 9])