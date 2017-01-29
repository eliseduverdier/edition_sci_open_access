Author.create([
  {
      person: Person.where(lastname: 'Einstein').take,
      paper: Paper.where(uuid: 'PHY001').take
  }, {
      person: Person.where(lastname: 'Chomsky').take,
      paper: Paper.where(uuid: 'LIN001').take
  }, {
      person: Person.where(lastname: 'Minenna').take,
      paper: Paper.where(uuid: 'PHY002').take
  }, {
      person: Person.where(lastname: 'Einstein').take,
      paper: Paper.where(uuid: 'MAT001').take
  }, {
      person: Person.where(lastname: 'Chomsky').take,
      paper: Paper.where(uuid: 'LIN002').take
  }, {
      person: Person.where(lastname: 'Chomsky').take,
      paper: Paper.where(uuid: 'LIN003').take
  }, {
      person: Person.where(lastname: 'Erdos').take,
      paper: Paper.where(uuid: 'MAT_OP001').take
  },

  { # sapir whorf paper
      person: Person.where(lastname: 'Sapir').take,
      paper: Paper.where(uuid: 'BADLIN001').take
  }, {
      person: Person.where(lastname: 'Whorf').take,
      paper: Paper.where(uuid: 'BADLIN001').take
  }
])
