function getTagNames(nodes) {
  const nodeArray = Array.prototype.slice.call(nodes);
  return nodeArray.map(({tagName}) => tagName);
}

function domTreeTracer(id) {
  let current = document.getElementById(String(id));
  let parent;
  let domTree = [];

  do {
    parent = current.parentNode;
    let children = getTagNames(parent.children);
     domTree.push(children);
     current = parent;
  } while (parent.tagName !== 'BODY');

  return domTree;
}

domTreeTracer(22);
