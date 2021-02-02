function matchCount(string, regex) {
  let matches = string.match(regex);
  return matches ? matches.length : 0;
}

function letterCaseCount(string) {
  return {
    lowercase: matchCount(string, /[a-z]/g),
    uppercase: matchCount(string, /[A-Z]/g),
    neither:   matchCount(string, /[^a-z]/gi),
  };
}
letterCaseCount('abCdef 123');  // { lowercase: 5, uppercase: 1, neither: 4 }
letterCaseCount('AbCd +Ef');    // { lowercase: 3, uppercase: 3, neither: 2 }
letterCaseCount('123');         // { lowercase: 0, uppercase: 0, neither: 3 }
letterCaseCount('');            // { lowercase: 0, uppercase: 0, neither: 0 }