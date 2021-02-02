function century(year) {
  let centuryIndex = math.floor((year-1) / 100) + 1;
  if (centuryIndex % 100 === 11 || enturyIndex % 100 === 12 || centuryIndex % 100 === 13) {
    return `${centuryIndex}th`
  } else if (centuryIndex % 10 === 1) {
    return `${centuryIndex}st`
  } else if (centuryIndex % 10 === 2) {
    return `${centuryIndex}nd`
  } else if (centuryIndex % 10 === 3) {
    return `${centuryIndex}rd`
  } else {
    return `${centuryIndex}th`
  }
}