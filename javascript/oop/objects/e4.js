function createStudent(name, year) {
  return {
    name, 
    year,
    courses: [],
    info() {
      console.log(`${name} is a ${year} year student`);
    },
    addCourse(course) {
      this.courses.push(course);
    },
    listCourses() {
      return this.courses;
    },
    addNote(courseCode, note) {
      let course = this.courses.find(({code}) => code === courseCode);
      if (course.notes === undefined) {
        course.notes = [note];
      } else {
        course.notes.push(note);
      }
    },
    updateNote(courseCode, note) {
      let course = this.courses.find(({code}) => code === courseCode);
      course.notes = [note];
    },
    viewNotes() {
      let notes = [];
      this.courses.forEach(course => {
        if (course.notes) {
          notes.push(course.name + ': ' + course.notes.join('; '));
        }
      });
      console.log(notes.join("\n"));
    },
  }
}
foo = createStudent('Foo', '1st');
foo.info();
// Foo is a 1st year student
console.log(foo.listCourses());
// [];
foo.addCourse({ name: 'Math', code: 101 });
foo.addCourse({ name: 'Advanced Math', code: 102 });
console.log(foo.listCourses());
// [{ name: 'Math', code: 101 }, { name: 'Advanced Math', code: 102 }]
foo.addNote(101, 'Fun course');
foo.addNote(101, 'Remember to study for algebra');
foo.viewNotes();
// Math: Fun Course; Remember to study for algebra
foo.addNote(102, 'Difficult subject');
foo.viewNotes();
// Math: Fun Course; Remember to study for algebra
// Advanced Math: Difficult Subject
foo.updateNote(101, 'Fun course');
foo.viewNotes();
// Math: Fun Course
// Advanced Math: Difficult Subject