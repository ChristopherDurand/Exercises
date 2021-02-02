function swapName(name) {
  let [first, last] = name.split(' ');
  return `${last}, ${first}`;
}


swapName('Joe Roberts');    // "Roberts, Joe"
