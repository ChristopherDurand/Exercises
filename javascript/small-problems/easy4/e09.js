
function countOccurrences(array) {
  let count = {};
  array.forEach(e => count[e] ? count[e] += 1 : count[e] = 1);
  Object.keys(count).forEach(key => {
    console.log(`${key} => ${count[key]}`);
  });
}

const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);