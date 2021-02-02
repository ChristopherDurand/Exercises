let name = prompt("What is your name?");
if (name[name.length-1] == '!') {
  name = name.slice(0, name.length-1);
  console.log(`hello ${name}. why are we screaming?`.toUpperCase());
} else {
  console.log(`Hello ${name}.`)
}