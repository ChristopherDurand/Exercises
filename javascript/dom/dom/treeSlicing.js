function sliceTree(rootId, leafId) {
  let current = document.getElementById(String(leafId));
  if (current === null) {
    return undefined;
  };
  let trace = [];
  let parent;
  do {
    trace.unshift(current);
    if (current.id === String(rootId)) {
      break;
    }
    current = current.parentNode;
  } while (current.tagName !== 'BODY');

  if (trace.every(({id}) => id !== String(rootId))) {
    return undefined;
  }


  return trace.map(({nodeName}) => nodeName);
}



console.log(sliceTree(1, 4));
console.log(sliceTree(1, 76));
console.log(sliceTree(2, 5));
console.log(sliceTree(5, 4));
console.log(sliceTree(1, 23));
console.log(sliceTree(1, 22));
console.log(sliceTree(11, 19));