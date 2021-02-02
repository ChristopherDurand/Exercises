/*
Inputs: positive integer

Outputs: Array of indicies of lights that are still on

Rules:
  On the first pass, you toggle every light.
  On the second pass, you toggle every second light.
  ...
  On the nth pass, you toggle every nth light.
  When you're done, write down the 1-indexed index of the lights.

Test Cases:

  lightsOn(5);        // [1, 4]
  // Detailed result of each round for `5` lights
  // Round 1: all lights are on
  // Round 2: lights 2 and 4 are now off;     1, 3, and 5 are on
  // Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
  // Round 4: lights 2 and 3 are now off;     1, 4, and 5 are on
  // Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

  lightsOn(100);      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
  lightsOn(5);        // [1, 4]

Data Structure: 
  Represent the lights as an array of booleans.
  Represent the list of indexes at the end as an array of integers.

Algorithm:
  Starting at one, and going up to and including the given n, as i,
    toggle the ith light.
  Reduce the array to an array of indexes.
  REturn the array of indexes.
*/

function lightsOn(switches) {
  let lights = [];
  for (let pass = 1; pass <= switches; pass++) {
    for (let light = pass; light <= switches; light += pass) {
      lights[light] = !lights[light];
    }
  }
  onLights = [];
  lights.forEach((light, index) => {
    if(light) onLights.push(index);
  });
  console.log(onLights);
  return onLights;
} 
  lightsOn(100);      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
  lightsOn(5);        // [1, 4]