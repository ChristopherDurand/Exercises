
function swapCaseChar(char) {
  if (/[a-z]/.test(char)) return char.toUpperCase();
  if (/[A-Z]/.test(char)) return char.toLowerCase();
  return char;
}

function swapCase(string) {
  console.log(string.split('').map(swapCaseChar).join(''));
}

swapCase('CamelCase');              // "cAMELcASE"
swapCase('Tonight on XYZ-TV');      // "tONIGHT ON xyz-tv"