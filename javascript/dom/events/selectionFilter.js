let classifications = {
  "Vertebrate": ['Bear', 'Turtle', 'Whale', 'Salmon', 'Ostrich'],
  "Warm-blooded":  ['Bear', 'Whale', 'Ostrich'],
  "Cold-blooded": ['Salmon', 'Turtle'],
  "Mammal": ['Bear', 'Whale'],
  "Bird": ["Ostrich"],
};

let animals = {
  'Bear': ['Vertebrate', 'Warm-blooded', 'Mammal'],
  'Turtle': ['Vertebrate', 'Cold-blooded'],
  'Whale': ['Vertebrate', 'Warm-blooded', 'Mammal'],
  'Salmon': ['Vertebrate', 'Cold-blooded'],
  'Ostrich': ['Vertebrate', 'Warm-blooded', 'Bird'],
};

document.addEventListener('DOMContentLoaded', () => {
  let classDropDown = document.getElementById('animal-classifications');
  let animalDropDown = document.getElementById('animals');

  function buildOptions (list) {
    let result = '';
    list.forEach(option => {
      result += `<option value="${option}">${option}</option>\n`
    });
    return result;
  }

  classDropDown.addEventListener('input', event => {
    let classification = event.target.value;
    let allowedAnimals = classifications[classification];
    animalDropDown.innerHTML = buildOptions(allowedAnimals);
    let allowedClasses = new Set(allowedAnimals.map(animal => animals[animal]).flat());
    classDropDown.innerHTML = buildOptions(allowedClasses);
  });
});