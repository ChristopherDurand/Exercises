/*
    Direct  Indirect
1:  9       12
2:  2       1
3:  1       0
4:  3       1
5:  1       0
6:  1       1
7:  1       0
8:  1       2
9:  1       1
10: 1       0


*/

function walk(node, callback) {
  callback(node);
  for (let i = 0; i < node.childNodes.length; i++) {
    walk(node.childNodes[i], callback);
  }
}

function childNodes(root) {
  function walk(node, callback) {
    callback(node);
    for (let i = 0; i < node.childNodes.length; i++) {
      walk(node.childNodes[i], callback);
    }
  }
  
  let children = root.childNodes.length;
  let indirect = 0;
  walk(root, node => { 
    if(node !== root) {
      indirect += 1;
    }
  });
  return [children, indirect - children];
}


let counts = [];
for (let i = 1; i < 11; i++) {
  let count = childNodes(document.getElementById(String(i)));
  console.log(String(i) + ': ' + String(count[0]) + ',  ' + String(count[1]));
}