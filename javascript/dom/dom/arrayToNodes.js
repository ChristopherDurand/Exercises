function arrayToNodes(nodes, parent) {
  let [tagName, children] = nodes;
  let current;
  if (tagName === 'BODY') {
    current = document.body;
  } else {
    current = document.createElement(tagName);
    parent.appendChild(current);
  }
  children.forEach(nodeList => arrayToNodes(nodeList, current));
}
/*
arrayToNodes(["BODY",[["HEADER",[]],["MAIN",[]],["FOOTER",[]]]]);

arrayToNodes(["BODY",[["DIV",[["DIV",[]],["DIV",[["DIV",[]]]]]],["DIV",[]],["DIV",[["DIV",[]],["DIV",[]],["DIV",[]]]]]]);
*/