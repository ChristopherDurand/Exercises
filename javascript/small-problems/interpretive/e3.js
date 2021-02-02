/*

Block Spelling

A collection of spelling blocks has two 
letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with 
the blocks to only those words that do 
not use both letters from any given block. 
You can also only use each block once.

Write a function that takes a word string 
as an argument, and returns true if the 
word can be spelled using the set of blocks, 
or false otherwise. You can consider the 
letters to be case-insensitive when you 
apply the rules.

input: a word string
output: boolean.

rules:
  We have a collection of blocks that pair letters together.
  a word cannot use both letters of a block.
  a block cannot be used more than once.
  Case does not matter.

test cases:
  isBlockWord('BATCH');      // true
  isBlockWord('BUTCH');      // false
  isBlockWord('jest');       // true

Data Structure:
  Represent the blocks as a constant array of strings with two characters.
  Copy the array into the function using the slice method.
  Represent the input as a string.
  Output is a boolean.

Algorithm:
  Copy the array of blocks into the function as a local variable.
  For each character in the string,
    If the character is available in the collection of blocks,
      remove that block.
    Otherwise,
      return false.
  If we got to the end of the word string and did not return false,
    return true.

['BO', 'XK', 'DQ', 'CP', 'NA', 'GT', 'RE', 'FS', 'JW', 'HU', 'VI', 'LY', 'ZM']


*/
const BLOCKS = ['BO', 'XK', 'DQ', 'CP', 'NA', 'GT', 'RE', 'FS', 'JW', 'HU', 'VI', 'LY', 'ZM'] 

function isBlockWord(word) {
  let availableBlocks = BLOCKS.slice();
  for (let charIndex = 0; charIndex < word.length; charIndex+=1) {
    let char = word[charIndex].toUpperCase();
    let foundBlock = false;
    for (let blockIndex = 0; blockIndex < availableBlocks.length; blockIndex++) {
      if (availableBlocks[blockIndex].includes(char)) {
        availableBlocks.splice(blockIndex, 1);
        foundBlock = true;
      }
    }
    if (!foundBlock) return false; 
  }
  return true;
}


console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('jest'));       // true
