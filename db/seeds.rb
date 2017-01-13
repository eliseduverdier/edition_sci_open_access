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
    }, {
        firstname: 'Noam',
        lastname: 'Chomsky',
        email: 'chomsky@mit.edu',
    }, {
        firstname: 'Damien',
        lastname: 'Minenna',
        email: 'd.minenna@blabla.amu.edu',
    }, {
        firstname: 'Nicolas',
        lastname: 'Bourbaki',
        email: 'bourbaki@ens.edu',
    },
])

authors = Author.create([
    {
        person_id: 1,#Person.where(name: 'Einstein').take.id,
        paper_id: 1#Paper.where(title: 'On the Electrodynamics of Moving Bodies').take.id
    }, {
        person_id: 2,#Person.where(name: 'Chomsky').take.id,
        paper_id: 2#Paper.where(title: 'Systems of Syntactic Analysis').take.id
    }, {
        person_id: 3,#Person.where(name: 'Minenna').take.id,
        paper_id: 3#Paper.where(type: 'thesis').take.id
    }
])

reviewers = Reviewer.create([
    {
        person_id: (Person.where(name: 'Minenna').take).id,
        paper_id: (Paper.where(title: 'On the Electrodynamics of Moving Bodies').take).id,
        status: 3, # accepted
        content: 'Nice paper'
    },
