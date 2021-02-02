function logEdge(length) {
  result = "+";
  for(let i = 0; i < length-2; i++) {
    result += '-';
  }
  console.log(result + '+');
}
function logInner(length) {
  result = "|";
  for(let i = 0; i < length-2; i++) {
    result += ' ';
  }
  console.log(result + '|');
}

function logInBox(string) {
  let bannerLength = string.length + 4;
  logEdge(bannerLength);
  logInner(bannerLength);
  console.log("| " + string + " |");
  logInner(bannerLength);
  logEdge(bannerLength);
}
logInBox('To boldly go where no one has gone before.');