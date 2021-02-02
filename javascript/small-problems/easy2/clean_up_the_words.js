function cleanup(string) {
  let alreadyPlacedSpace = false;
  let result = "";
  for (let i = 0; i < string.length; i++) {
    if(string[i].match(/[a-zA-Z]/)){
      result += string[i];
      alreadyPlacedSpace = false;
    } else if (alreadyPlacedSpace) {
      continue;
    } else {
      result += " "
      alreadyPlacedSpace = true;
    }
  }
  return result;
}
