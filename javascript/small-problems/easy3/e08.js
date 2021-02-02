function wordSizes(sentence) {
  let tally = {};
  sentence.split(/\s+/).forEach(word => {
    let size = String(word.length);
    if (tally[size]) {
      tally[size] += 1;
    } else {
      tally[size] = 1;
    }
  });
  console.log(tally);
}



wordSizes('Four score and seven.');                       // { "3": 1, "4": 1, "5": 1, "6": 1 }
wordSizes('Hey diddle diddle, the cat and the fiddle!');  // { "3": 5, "6": 1, "7": 2 }
wordSizes("What's up doc?");                              // { "2": 1, "4": 1, "6": 1 }
wordSizes(''); 