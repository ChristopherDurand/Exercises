function capitalize(string) {
  return string[0].toUpperCase() + string.slice(1).toLowerCase();
}

function wordCap(string) {
  return string.split(" ").map(capitalize).join(" ");
}

wordCap('four score and seven');       // "Four Score And Seven"
wordCap('the javaScript language');    // "The Javascript Language"
wordCap('this is a "quoted" word');    // 'This Is A "quoted" Word'