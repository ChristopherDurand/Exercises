function doubleConsonants(string) {
  let consonants = /([qwszxdcrfvtgbyhnjmklp])/gi;
  console.log(string.replace(consonants, '$1$1'));
  return string.replace(consonants, '$1$1');
}


doubleConsonants('String');          // "SSttrrinngg"
doubleConsonants('Hello-World!');    // "HHellllo-WWorrlldd!"
doubleConsonants('July 4th');        // "JJullyy 4tthh"
doubleConsonants('');                // ""