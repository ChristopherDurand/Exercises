function stagger(char, index) {
  let func = ['toUpperCase', 'toLowerCase'][index % 2];
  return char[func]();
}

function staggeredCase(string) {
  console.log(string.split('').map(stagger).join(''));
}

staggeredCase('I Love Launch School!');        // "I LoVe lAuNcH ScHoOl!"
staggeredCase('ALL_CAPS');                     // "AlL_CaPs"
staggeredCase('ignore 77 the 444 numbers');    // "IgNoRe 77 ThE 444 NuMbErS"