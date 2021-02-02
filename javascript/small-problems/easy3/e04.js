function isPalindrome(text) {
  return text === text.split('').reverse().join('');
}

function isRealPalindrome(text) {
  return isPalindrome(text.replace(/[^a-zA-Z0-9]/g,'').toLowerCase())
}


console.log(isRealPalindrome('madam'));               // true
console.log(isRealPalindrome('Madam'));               // true (case does not matter)
console.log(isRealPalindrome("Madam, I'm Adam"));     // true (only alphanumerics matter)
console.log(isRealPalindrome('356653'));              // true
console.log(isRealPalindrome('356a653'));             // true
console.log(isRealPalindrome('123ab321'));            // false