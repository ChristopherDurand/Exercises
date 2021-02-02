function reverseSentence(sentence) {
  console.log(sentence.split(" ").reverse().join(" "));
}

reverseSentence('');                       // ""
reverseSentence('Hello World');            // "World Hello"
reverseSentence('Reverse these words');    // "words these Reverse"