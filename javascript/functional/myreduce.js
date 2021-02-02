function myReduce(array, func, initialValue) {
  let start;
  let value;
  if(initialValue === undefined) {
    start = 1;
    value = array[0];
  } else {
    start = 0;
    value = initialValue;
  }
  array.slice(start).forEach(element => value = func(value, element));
  return value;
}
let smallest = (result, value) => (result <= value ? result : value);
let sum = (result, value) => result + value;

console.log(myReduce([5, 12, 15, 1, 6], smallest));           // 1
console.log(myReduce([5, 12, 15, 1, 6], sum, 10));            // 49

function longestWord(words) {
  return myReduce(words, longest);
}

function longest(result, currentWord) {
  return currentWord.length >= result.length ? currentWord : result;
}

console.log(longestWord(['abc', 'launch', 'targets', '']));      // "targets"