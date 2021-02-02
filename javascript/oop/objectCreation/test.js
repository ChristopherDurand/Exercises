function Contact(name, gender) {
  this.name = name;
  this.gender = gender;
  this.hasName = (givenName) => this.name === givenName;
}

let contacts = {
  list: [],
  add(name, gender) {
    var contact = new Contact(name, gender);
    this.list.push(contact);
  },
  males() {
    return this.list.filter(function(contact) {
      return contact.gender === 'male';
    });
  },
  females() {
    return this.list.filter(function(contact) {
      return contact.gender === 'female';
    });
  },
  filterByName(name) {
    return this.list.filter(function(contact) {
      return contact.hasName(name)
    });
  },
};

contacts.add("joe", "male");
contacts.add("john", "male");
contacts.add("joey", "male");
contacts.add("joseph", "male");
contacts.add("jebbediah", "male");
contacts.add("jane", "male");
contacts.add("jane", "female");
contacts.add("jane", "female");
contacts.add("jacky", "female");
contacts.add("jessica", "female");
contacts.add("jasmine", "female");
contacts.add("jaqueline", "female");

console.log(contacts.list);
console.log(contacts.males());
console.log(contacts.females());
console.log(contacts.filterByName("jane"));
console.log(contacts.filterByName("joe"));

