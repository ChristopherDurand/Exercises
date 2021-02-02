
function multiplyLists(a, b) {
  let result = [];
  for (let i = 0; i < a.length; i++) {
    result[i] = a[i] * b[i];
  }
  return result;
}