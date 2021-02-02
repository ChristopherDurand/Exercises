let bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

function capitalize(name) {
  return name.split(" ")
             .map(word => word[0].toUpperCase() + word.slice(1).toLowerCase())
             .join(" ");
}

function removePeriods(word){
  return word.replace(/\./g,'');
}

function processBand(band) {
 return {
    name: capitalize(removePeriods(band.name)),
    country: "Canada",
    active: band.active,
  };
}

function processBands(data) {
  return bands.map(processBand);
}

console.log(processBands(bands));


// [
//   { name: 'Sunset Rubdown', country: 'Canada', active: false },
//   { name: 'Women', country: 'Canada', active: false },
//   { name: 'A Silver Mt Zion', country: 'Canada', active: true },
// ]