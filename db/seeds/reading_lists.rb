ReadingList.create([
  {
    person: Person.where(lastname: 'Einstein').take,
    name: 'Albert’s reading list',
    visibility: 0,
  }, {
    person: Person.where(lastname: 'Chomsky').take,
    name: 'Noam’s reading list',
    visibility: 0,
  }, {
    person: Person.where(lastname: 'Minenna').take,
    name: 'Damien’s reading list',
    visibility: 0,
  }, {
    person: Person.where(lastname: 'Newton').take,
    name: 'Isaac’s reading list',
    visibility: 0,
  }, {
    person: Person.where(lastname: 'Erdos').take,
    name: 'Paul’s reading list',
    visibility: 0,
  }, {
    person: Person.where(lastname: 'Sapir').take,
    name: 'Edward’s reading list',
    visibility: 0,
  }, {
    person: Person.where(lastname: 'Whorf').take,
    name: 'Benjamin’s reading list',
    visibility: 0,
  }, {
    person: Person.where(lastname: 'Bourbaki').take,
    name: 'Nicolas’s reading list',
    visibility: 0,
  }, {
    person: Person.where(lastname: 'Duverdier').take,
    name: 'Elise’s reading list',
    visibility: 0,
  }, {
    person: Person.where(firstname: 'Ed').take,
    name: 'Ed’s reading list',
    visibility: 0,
  }, {
    person: Person.where(firstname: 'Zed').take,
    name: 'Zed’s reading list',
    visibility: 0,
  }
])
