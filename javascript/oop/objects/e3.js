function objectsEqual(a, b) {
  let aKeys = Object.keys(a).sort();
  let bKeys = Object.keys(b).sort();
  if (aKeys.length !== bKeys.length) {
    return false;
  } else {
    let equal = true;
    aKeys.forEach((key, index) => {
      if (a[key] !== b[key] || key !== bKeys[index]) {
        equal = false;
      }
    });
    return equal;
  }
}
console.log(objectsEqual({a: 'foo'}, {a: 'foo'}));                      // true
console.log(objectsEqual({a: 'foo', b: 'bar'}, {a: 'foo'}));            // false
console.log(objectsEqual({}, {}));                                      // true
console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo', c: 1}));  // false