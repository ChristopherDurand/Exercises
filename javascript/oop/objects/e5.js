


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