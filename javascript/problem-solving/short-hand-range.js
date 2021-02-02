/*

Problem Description

You are given a list of numbers in a "short-hand" range 
where only the significant part of the next number is 
written because we know the numbers are always increasing 
(ex. "1, 3, 7, 2, 4, 1" represents [1, 3, 7, 12, 14, 21]). 
Some people use different separators for their ranges 
(ex. "1-3, 1-2", "1:3, 1:2", "1..3, 1..2" represent the same 
numbers [1, 2, 3, 11, 12]). Range limits are always inclusive.

Your job is to return a list of complete numbers.

The possible separators are: ["-", ":", ".."]

Input: A string of characters that represents a list of numbers

Output: 
  an array of numbers.

Rules:
  each comma is a delimiter for a "range"
  a "range" has a one or more bounds, all of which are inclusive
  Valid range separators are -, :, ..
  Numbers are always increasing.
    If the next number is less than the previous number, 
    assume the highest digit(s) is missing and go from there.
    ex: 104-2 -> 2 is lower than 104, so find the next 
        number higher than 104 that ends in 2.
    ex: 104-02 -> 2 is lower than 104, so find the next 
        number higher than 104 that ends in 02.
  Assumption:
    Numbers will always be positive

Data Structures:
  represent the input as an array of "ranges"
  each range is an array of strings, first being the lower bound, with each subsequent being another bound
  
Algorithm:
  split the input string on commas to get array of ranges
  split each range on the range delimiters to get array of arrays
  Keep track of current number as lowest, initialize to 0.
  for each range,
    for each number Bound in the range,
      if this is the first bound in the range,
        we do not need to add the intermediate values.
        if bound <= lowest,
          find the next number that ends in the digits of bound.
          Set lowest to that number.
        otherwise, bound > lowest.
          set lowest = bound.
        push lowest.
      if this is not the first bound in the range,
        we need to add the intermediate values.
          if bound <= lowest,
            find the next number that ends in the digits of bound.
              While we're doing this, keep track of the numbers greater than lowest,
              and push them to the result array.
              set lowest = to the number we found.
          otherwise, bound > lowest.
            Count up from lowest+1 to bound, and push each number into result along the way.
            set lowest = bound.
  return the result.

function next lowest number - lowest, bound, optional array
  Given a lowest number, and the digits the number needs to come from.
  Optionally given an array to push the intermediate values to.
  Counting up from lowest + 1 as n,
    if given, push n to the array.
    if n ends in bound,
      that is the number we are looking for.
      return n.

*/

function endsIn(number, digits) {
  let regex = new RegExp(`${digits}$`)
  return regex.test(String(number));
}

function nextLowestNumber(lowest, bound) {
  let n = lowest;
  while (true) {
    n += 1;
    if (endsIn(n, bound)) return n;
  }
}

function expandRange(rangeString) {
  let ranges = rangeString.split(', ').map((range) => range.split(/([\-:]|(\.\.))/));
  let result = [];
  let lowest = 0;
  for (let rangeIndex = 0; rangeIndex < ranges.length; rangeIndex+=1) {
    let range = ranges[rangeIndex];
    for (let boundIndex = 0; boundIndex < range.length; boundIndex += 1) {
      let bound = range[boundIndex];
      if (boundIndex === 0) {
        if (Number(bound) <= lowest) {
          lowest = nextLowestNumber(lowest, bound);
        } else {
          lowest = Number(bound);
        }
        result.push(lowest);
      } else {
        if (Number(bound) <= lowest) {
          upperBound = nextLowestNumber(lowest, bound);
          for (let n = lowest+1; n <= upperBound; n++) {
            result.push(n);
          }
        } else {
          while (lowest < Number(bound)) {
            lowest += 1;
            result.push(lowest);
          }
        }
      }
    }
  }
  console.log(result);
  return result;
}



expandRange("1, 3, 7, 2, 4, 1"); // [1, 3, 7, 12, 14, 21]
expandRange("1-3, 1-2");         // [1, 2, 3, 11, 12]
expandRange("1:5:2");            // [1, 2, 3, 4, 5, 6, ... 12]
expandRange("104-2");            // [104, 105, ... 112]
expandRange("104-02");           // [04, 105, ... 202]
expandRange("545, 64:11");       // [545, 564, 565, .. 611]

