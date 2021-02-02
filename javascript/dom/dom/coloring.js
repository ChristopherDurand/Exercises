function childrenOf(nodes) {
  let nextGen = [];
  for (let i = 0; i < nodes.length; i++) {
    let children = nodes[i].children;
    for (let j = 0; j < children.length; j++) {
      nextGen.push(children[j]);
    }
  }
  return nextGen;
}

function colorGeneration(generation) {
  let nodesToColor = document.body;
  for (let i = 0; i < generation; i++) {
    nodesToColor = childrenOf(nodesToColor);
  }
  for (let i = 0; i < nodesToColor.length; i++) {
    nodesToColor.classList.add('generation-color');
  }
}

