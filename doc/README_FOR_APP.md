Use this README file to introduce your application and point to useful places in the API for learning more.
Run "rake doc:app" to generate API documentation for your models, controllers, helpers, and libraries.

# Database
Database description, meaning of attributes and possible values for each.

## categories
 * id
 * name
 * parent_category [categories.id]


## papers
 * id
 * paper_type        (article, letter, thesis)
 * title
 * doi               (digital object identifier)
 * abstract
 * status            (0: refused, 1: accepted, 2:pending)
 * publication_date  (can be in the future ?)
 * tex_content
 * html_content
 * pdf_url
 * category_id   [categories.id]

 * received_at ( = created_at?)
 * accepted_at ( when reviews are ok and editor says go )
 * conflict_interests
 * licence ( everything is in open access but licence can vary. CC: BY SA by default)


## people
 * id
 * email
 * password
 * password_digest
 * firstname
 * lastname
 * status  (reader / author /  3: editor)
 * bio
 * level    
 * university
 * academic_status  (in academia: undergrad, grad, phd, postdoc, mdc, etc...)
 * country
 * academia_url
 * research_gate_url

 * affiliations


## authors
 * id
 * person_id   [people.id]
 * paper_id    [paper.id]
 * status      (first_author, null)


## reviewers
 * id
 * person_id   [people.id]
 * paper_id    [paper.id]
 * status      pending, ongoing, done
 * content     content (general points to the paper)
 * notes       notes on document


## reading_list_folders
 * id
 * name


## reading_lists
 * id
 * person_id
 * paper_id
 * reading_list_folder_id


## interests
 * category_id
 * person_id


---

# Views / actions

## Papers
 * all
   * default: see all new articles
   * can choose to see best by date papers
   * or by categories
 * show
   * if article is published:
   * if article is unpublished (undergoing peer review):
   * if current_user wrote the article:
 * new
 * edit
   * (only if current_user wrote the article)
   * can modify the content and abstract only (not the title)
   * can add authors (autocomplete which looks for user on the website)
