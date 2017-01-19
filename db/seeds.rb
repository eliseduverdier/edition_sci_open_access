# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
 Category.create([
  { name: 'physics' },
  { name: 'philosophy' },
  { name: 'linguistics' },
  { name: 'maths' },
])

Paper.create([
  {
    paper_type: 'article',
    uuid: 'PHY001',
  	title: 'On the Electrodynamics of Moving Bodies',
    status: 2,
  	abstract: '...',
    html_content: '<h1>HTML Ipsum Presents</h1> <p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. <a href="#">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p> <h2>Header Level 2</h2> <ol> <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li> <li>Aliquam tincidunt mauris eu risus.</li> </ol> ',
  	publication_date: '1905',
  	pdf_url: '',
  	category: Category.where(name: 'physics').take
  }, {
    paper_type: 'article',
    uuid: 'LIN001',
  	title: 'Systems of Syntactic Analysis',
    status: 1,
  	abstract: '<p>During the past several decades, linguists have developed and applied widely techniques which enable them, to a considerable extent, to determine and state the structure of natural languages without semantic reference. It is of interest to inquire seriously into the formality of linguistic method and the adequacy of whatever part of it can be made purely formal, and to examine the possibilities of applying it, as has occasionally been suggested, to a wider range of problems. In order to pursue these aims it is first necessary to reconstruct carefully the set of procedures by which the linguist derives the statements of a linguistic grammar from the behaviour of language users, distinguishing clearly between formal and experimental in such a way that grammatical notions, appearing as definienda in a constructional system, will be formally derivable for any language from a fixed sample of linguistic material upon which the primitives of the system are experimentally defined. The present paper will be an attempt to formalize a certain part of the linguist’s generalized syntax language.</p><p> From another point of view, this paper is an attempt to develop an adequate notion of syntactic category within an inscriptional nominalistic framework. The inscriptional approach seems natural for linguistics, particularly in view of the fact that an adequate extension of the results of this paper will have to deal with the problem of homonymity, i.e., with a statement of the conditions under which tokens of the same type must be assigned to different syntactic classes.</p>',
  	publication_date: '1953',
  	pdf_url: 'https://chomsky.info/wp-content/uploads/195309-.pdf',
  	category: Category.where(name: 'linguistics').take
  }, {
    paper_type: 'thesis',
    uuid: 'PHY002',
  	title: 'Description hamiltonienne de l’intéraction ondes-électrons dans un guide d’onde périodique',
    status: 0,
  	abstract: 'L’intéraction entre un faiseau d’électrons et',
  	publication_date: '2016',
  	pdf_url: '',
  	category: Category.where(name: 'physics').take
  }, {
    paper_type: 'letter',
    uuid: 'LIN002',
  	title: 'Letter about linguistics',
    status: 2,
  	abstract: 'Does opinion letters have abstract ?',
  	html_content: 'Bla blabla bla banana',
  	publication_date: '2016',
  	pdf_url: '',
  	category: Category.where(name: 'linguistics').take
  }, {
    paper_type: 'article',
    uuid: 'PHY003',
  	title: 'Physics article 003',
    status: 3,
  	abstract: 'Very bad paper pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> ',
  	publication_date: '2016',
  	pdf_url: '',
  	category: Category.where(name: 'physics').take
  },
])

Person.create([
  {
    firstname: 'Albert',
    lastname: 'Einstein',
    status: 'researcher',
    email: 'einstein@test-princeton.edu',
    password: '123456789',
    password_confirmation: '123456789',
    activated: true,
     activated_at: Time.zone.now
  }, {
    firstname: 'Noam',
    lastname: 'Chomsky',
    status: 'researcher',
    email: 'noamchomsky@test-mit.edu',
    password: '123456789',
    password_confirmation: '123456789',
    activated: true,
     activated_at: Time.zone.now
  }, {
    firstname: 'Damien',
    lastname: 'Minenna',
    status: 'researcher',
    email: 'd.minenna@test-amu.edu',
    password: '123456789',
    password_confirmation: '123456789',
    activated: true,
     activated_at: Time.zone.now
  }, {
    firstname: 'Nicolas',
    lastname: 'Bourbaki',
    status: 'reader',
    email: 'bourbaki@test-ens.edu',
    password: '123456789',
    password_confirmation: '123456789',
    activated: true,
     activated_at: Time.zone.now
  }, {
    firstname: 'Elise',
    lastname: 'Duverdier',
    status: 'admin',
    email: 'elise@test.com',
    password: '123456789',
    password_confirmation: '123456789',
    activated: true,
     activated_at: Time.zone.now
  }, {
    firstname: 'Ed',
    lastname: 'Itor',
    status: 'editor',
    email: 'editor@test.com',
    password: '123456789',
    password_confirmation: '123456789',
    activated: true,
     activated_at: Time.zone.now
  }
])

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
      paper: Paper.where(uuid: 'PHY003').take
  }, {
      person: Person.where(lastname: 'Chomsky').take,
      paper: Paper.where(uuid: 'LIN002').take
  }
])

Reviewer.create([
  {  # Damien did review Einstein's paper
      person: (Person.where(lastname: 'Minenna').take),
      paper: (Paper.where(uuid: 'PHY001').take),
      status: 3, # accepted
      progression: 'done',
      content: 'Nice paper'
  }, { # Einstein is reviewing Damien's paper
      person: (Person.where(lastname: 'Einstein').take),
      paper: (Paper.where(uuid: 'PHY002').take),
      progression: 'ongoing',
      content: 'Quite interesting'
  }, { # Einstein reviewed Chomsky's paper
      person: (Person.where(lastname: 'Einstein').take),
      paper: (Paper.where(uuid: 'LIN001').take),
      progression: 'done',
      status: 1, # major modif
      content: 'Didn’t get that'
  }, { # Chomsky has to review Damien's paper
      person: (Person.where(lastname: 'Chomsky').take),
      paper: (Paper.where(uuid: 'PHY002').take),
      progression: 'pending',
  }
])
