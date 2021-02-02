function makeStack() {
  let data = [];
  return {
    pop() {
      return data.pop();
    },
    push(obj) {
      return data.push(obj);
    },
    printStack() {
      data.forEach(element => console.log(element));
    },
  };
}