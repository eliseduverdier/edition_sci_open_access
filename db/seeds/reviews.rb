Review.create([
  {  # Damien reviewed Einstein's paper (says Ed)
      paper: Paper.where(uuid: 'PHY001').take,
      reviewer_id: (Person.where(lastname: 'Minenna').take).id,
      editor_id: (Person.where(firstname: 'Ed').take).id,
      progression: 'done',
      status: 3, # accepted
      content: 'Nice paper'
  }, {# Damien has to review Chomsky's paper (says Zed)
      paper: Paper.where(uuid: 'LIN001').take,
      reviewer_id: (Person.where(lastname: 'Minenna').take).id,
      editor_id: (Person.where(firstname: 'Zed').take).id,
      progression: 'pending',
      content: 'Nice paper, haven’t decided yet / will set a status later.'
  }, { # Einstein is reviewing Damien's paper (says Ed)
      paper: Paper.where(uuid: 'PHY002').take,
      reviewer_id: (Person.where(lastname: 'Einstein').take).id,
      editor_id: (Person.where(firstname: 'Ed').take).id,
      progression: 'ongoing',
      content: 'Quite interesting'
  }, { # Einstein reviewed Chomsky's paper (says Zed)
      paper: Paper.where(uuid: 'LIN001').take,
      reviewer_id: (Person.where(lastname: 'Einstein').take).id,
      editor_id: (Person.where(firstname: 'Zed').take).id,
      progression: 'done',
      status: 1, # major modif
      content: 'Didn’t get that'
  }, { # Chomsky has to review Damien's paper (says Ed)
      paper: Paper.where(uuid: 'PHY002').take,
      reviewer_id: (Person.where(lastname: 'Chomsky').take).id,
      editor_id: (Person.where(firstname: 'Ed').take).id,
      progression: 'pending',
  }
])
