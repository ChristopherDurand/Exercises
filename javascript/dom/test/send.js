let xhr = new XMLHttpRequest();
let data = {title: 'Buy Milk', completed: true}

xhr.open('PUT', 'my-todo-app.com/todos/15');
xhr.setRequestHeader('Content-Type', 'application/json');
xhr.responseType = 'json';
let json = JSON.stringify(data);
xhr.send();

xhr.addEventListener('load', event => {
  let json2 = xhr.response;
  let str = `title=${json2.title}, completed=${json2.completed}`;
  console.log(str)
});