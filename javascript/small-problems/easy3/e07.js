function swap(sentence) {
  return sentence.replace(/\b(\w)(\w*)(\w)\b/g, '$3$2$1');
}



swap('Oh what a wonderful day it is');  // "hO thaw a londerfuw yad ti si"
swap('Abcde');                          // "ebcdA"
swap('a');                              // "a"