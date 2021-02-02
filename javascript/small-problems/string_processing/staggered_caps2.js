function staggeredCase(string) {
  let caseFunction = ['toUpperCase', 'toLowerCase'];
  let caseIndex = 1;
  return string.split('').map(char => {
    if (/[a-z]/i.test(char)) {
      caseIndex = (caseIndex + 1) % 2;
      return char[caseFunction[caseIndex]]();
    } else {
      return char;
    }
  }).join('');
}

staggeredCase('I Love Launch School!');        // "I lOvE lAuNcH sChOoL!"
staggeredCase('ALL CAPS');                     // "AlL cApS"
staggeredCase('ignore 77 the 444 numbers');    // "IgNoRe 77 ThE 444 nUmBeRs"