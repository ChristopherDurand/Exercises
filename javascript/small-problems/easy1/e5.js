function shortLongShort(short, long) {
  if (short.length > long.length) {
    [short, long] = [long, short];
  }
  return short + long + short;
}
console.log(shortLongShort('abc', 'defgh'));    // "abcdefghabc"
console.log(shortLongShort('abcde', 'fgh'));    // "fghabcdefgh"
console.log(shortLongShort('', 'xyz'));   