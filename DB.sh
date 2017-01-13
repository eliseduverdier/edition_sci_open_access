
rails destroy scaffold Category
rails destroy scaffold Paper
rails destroy scaffold Person
rails destroy scaffold Author
rails destroy scaffold Reviewer
rails destroy scaffold ReadingListFolder
rails destroy scaffold ReadingList

rails generate scaffold Category \
	name:string \
    category_parent:references

rails generate scaffold Paper \
	paper_type:string \
	title:string \
	abstract:text \
	status:string \
	publication_date:date \
	tex_content:text \
	html_content:text \
	pdf_url:string \
	category:references

rails generate scaffold Person \
	email:string \
	password:string \
	firstname:string \
	lastname:string \
	born:integer \
	status:string \
	university:string \
	academic_position:string \
	bio:text \
	level:string \
	country:string \
	academia_url:string \
	research_gate_url:string

rails generate scaffold Author \
	person:references \
	paper:references \
	status:string

rails generate scaffold Reviewer \
	person:references \
	paper:references \
	status:string \
	content:text

rails generate scaffold ReadingListFolder \
	name:string

rails generate scaffold ReadingList \
	person:references \
	paper:references \
	reading_list_folder:references
