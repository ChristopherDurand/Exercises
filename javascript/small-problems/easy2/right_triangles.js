function triangle(n) {
  for (let i = n; i > 0; i--) {
    let row = "";
    for(let j = 1; j <= n; j++) {
      if (j < i) {
        row += " ";
      } else {
        row += "*";
      }
    }
    console.log(row);
  }
}