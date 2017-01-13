# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([
    { name: 'physics' },
    { name: 'philosophy' },
    { name: 'linguistics' },
    { name: 'maths' },
])

papers = Paper.create([
    {
        paper_type: 'article',
    	title: 'On the Electrodynamics of Moving Bodies',
    	abstract: '...',
        html_content: '<h1>HTML Ipsum Presents</h1> <p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. <a href="#">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p> <h2>Header Level 2</h2> <ol> <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li> <li>Aliquam tincidunt mauris eu risus.</li> </ol> ',
    	publication_date: '1905',
    	pdf_url: '',
    	category: Category.where(name: 'physics').take
    }, {
        paper_type: 'article',
    	title: 'Systems of Syntactic Analysis',
    	abstract: '...',
    	publication_date: '1953',
    	pdf_url: 'https://chomsky.info/wp-content/uploads/195309-.pdf',
    	category: Category.where(name: 'linguistics').take
    }, {
        paper_type: 'thesis',
    	title: 'Description hamiltonienne de l’intéraction ondes-électrons dans un guide d’onde périodique',
    	abstract: 'L’intéraction entre un faiseau d’électrons et ...',
    	publication_date: '2016',
    	pdf_url: '',
    	category: Category.where(name: 'physics').take
    },
])

people = Person.create([
    {
        firstname: 'Albert',
        lastname: 'Einstein',
        email: 'einstein@end.princeton.edu',
        password: '123456789'
    }, {
        firstname: 'Noam',
        lastname: 'Chomsky',
        email: 'chomsky@mit.edu',
        password: '123456789'
    }, {
        firstname: 'Damien',
        lastname: 'Minenna',
        email: 'd.minenna@blabla.amu.edu',
        password: '123456789'
    }, {
        firstname: 'Nicolas',
        lastname: 'Bourbaki',
        email: 'bourbaki@ens.edu',
        password: '123456789'
    },
])

authors = Author.create([
    {
        person: Person.where(lastname: 'Einstein').take,
        paper: Paper.where(title: 'On the Electrodynamics of Moving Bodies').take
    }, {
        person: Person.where(lastname: 'Chomsky').take,
        paper: Paper.where(title: 'Systems of Syntactic Analysis').take
    }, {
        person: Person.where(lastname: 'Minenna').take,
        paper: Paper.where(title: 'Description hamiltonienne de l’intéraction ondes-électrons dans un guide d’onde périodique').take
    }
])

reviewers = Reviewer.create([
    {
        person: (Person.where(lastname: 'Minenna').take),
        paper: (Paper.where(title: 'On the Electrodynamics of Moving Bodies').take),
        status: 3, # accepted
        content: 'Nice paper'
    }, {
        person: (Person.where(lastname: 'Eintein').take),
        paper: (Paper.where(title: 'Description hamiltonienne de l’intéraction ondes-électrons dans un guide d’onde périodique').take),
        status: 2, # minor modif
        content: 'Quite interesting'
    }
])
