function isPalindrome(text) {
  return text === text.split('').reverse().join('');
}

function isRealPalindrome(text) {
  return isPalindrome(text.replace(/[^a-zA-Z0-9]/g,'').toLowerCase())
}

function isPalindromicNumber(number) {
  return isPalindrome(String(number));
}


console.log(isPalindromicNumber(34543));        // true
console.log(isPalindromicNumber(123210));       // false
console.log(isPalindromicNumber(22));           // true
console.log(isPalindromicNumber(5));            // true