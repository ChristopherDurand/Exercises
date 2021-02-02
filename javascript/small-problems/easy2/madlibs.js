const PARTS = ['noun', 'verb', 'adjective', 'adverb']
let answers = [];
for (let i = 0; i < PARTS.length; i++) {
  answers.push(prompt(`Enter a ${PARTS[i]}:`))
}

console.log(`Do you ${answers[1]} your ${answers[2]} ${answers[0]} ${answers[3]}? That's awful!`)