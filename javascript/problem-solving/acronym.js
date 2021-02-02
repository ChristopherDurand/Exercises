function acronym(string) {
  return string.split(/[ \-]/)
               .map( word => word[0].toUpperCase() )
               .join('');
}

console.log(acronym('Portable Network Graphics'));
console.log(acronym('First In, First Out'));
console.log(acronym('PHP: HyperText Preprocessor'));
console.log(acronym('Complementary metal-oxide semiconductor'));
console.log(acronym('Hyper-text Markup Language'));