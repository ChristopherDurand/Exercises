
function area(rectangle) {
  return rectangle[0] * rectangle[1];
}

let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

function totalArea(rectangles) {
  return rectangles.map(area).reduce((total, area) => total + area);
}

function isSquare(rectangle) {
  return rectangle[0] === rectangle[1];
}

function totalSquareArea(rectangles) {
  let squares = rectangles.filter(isSquare);
  return totalArea(squares);
}

console.log(totalArea(rectangles)); 

console.log(totalSquareArea(rectangles));    // 121