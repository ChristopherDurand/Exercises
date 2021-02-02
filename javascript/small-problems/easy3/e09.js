function wordSizes(sentence) {
  let tally = {};
  sentence.replace(/[^a-z ]/gi, '').split(/\s+/).forEach(word => {
    let size = String(word.length);
    if (tally[size]) {
      tally[size] += 1;
    } else {
      tally[size] = 1;
    }
  });
  console.log(tally);
}



wordSizes('Four score and seven.');                       // { "3": 1, "4": 1, "5": 2 }
wordSizes('Hey diddle diddle, the cat and the fiddle!');  // { "3": 5, "6": 3 }
wordSizes("What's up doc?");                              // { "5": 1, "2": 1, "3": 1 }
wordSizes('');                                            // {}