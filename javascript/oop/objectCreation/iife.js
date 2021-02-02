let randomNumber = () => String(Math.floor(Math.random() * 10));
let randomSSN = () => {
  let result = '';
  for (let i = 0; i < 7; i++) {
    result += randomNumber();
  }
  return result;
};

let Person = (() => {
  let SSN = randomSSN();
  return {
    
  }
}();

let bob = new Person("bob");
let sandy = new Person("sandy");
console.log(bob.getSSN());
console.log(sandy.getSSN());
)