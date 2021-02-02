function centerOf(string) {
  let start = Math.floor((string.length-1) / 2);
  let end = Math.ceil((string.length-1) / 2);
  return string.slice(start, end+1);
}


centerOf('I Love JavaScript'); // "a"
centerOf('Launch School');     // " "
centerOf('Launch');            // "un"
centerOf('Launchschool');      // "hs"
centerOf('x');                 // "x"