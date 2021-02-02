function average(numbers) {
  return Math.floor(numbers.reduce((sum, val) => sum + val) / numbers.length);
}

average([1, 5, 87, 45, 8, 8]);       // 25
average([9, 47, 23, 95, 16, 52]);    // 40