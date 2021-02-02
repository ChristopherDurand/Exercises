function sortedChars(word) {
  let charCodeDifference = (c1, c2) => c1.charCodeAt(0) - c2.charCodeAt(0);
  return word.split("").sort(charCodeDifference).join("");
}

function isAnagramWith(chosenWord) {
  return function(word) {
    return sortedChars(word) === sortedChars(chosenWord);
  }
}

function anagram(chosenWord, list) {
   return list.filter(isAnagramWith(chosenWord))
}



console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana'])); // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));  // [ "enlist", "inlets" ]