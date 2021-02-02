function reverseNumber(n) {
  console.log(Number(String(n).split('').reverse().join('')));
  return Number(String(n).split('').reverse().join(''));
}


reverseNumber(12345);    // 54321
reverseNumber(12213);    // 31221
reverseNumber(456);      // 654
reverseNumber(12000);    // 21 -- Note that zeros get dropped!
reverseNumber(1);        // 1

