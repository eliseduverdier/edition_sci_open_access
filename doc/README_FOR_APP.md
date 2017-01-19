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
 * uuid              (internal reference for the website, maybe DOI)
 * paper_type        (article, letter, thesis)
 * title
 * doi               (digital object identifier)
 * abstract
 * keywords          (list encoded in json)
 * status
    *-1: pending, not reviewed
    * 0: pending, reviewed
    * 1: pending: reviews finished
    * 2: accepted
    * 3: refused
 * (publication_date)  (can be in the future ?)
 * tex_content
 * html_content
 * pdf_url
 * category_id   [categories.id]

 * received_at ( = created_at?)
 * accepted_at ( when reviews are ok and editor says go )
 * conflict_interests
 * licence ( everything is open but licence can vary. Default: CC BY SA)


## people
 * id
 * email
 * password
 * password_digest
 * firstname
 * lastname
 * status  (reader / researcher / editor / admin)
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
 * status     
     * 0: refused
     * 1: major modif
     * 2: minor modif
     * 3: accepted
 * progression
     * 0: pending
     * 1: ongoing
     * 2: done
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
   * default: see all new articles (for readers, researchers)
   `papers/new`
   * can choose to see best by date papers
   `papers/top/(all|year|month|week)`
   * or by categories
   `categories/<name>`
   * if editor: can see all articles
    `papers/unpublished`
 * show
   * if article is published:
   * if article is unpublished (undergoing peer review):
   * if current_user wrote the article:
 * new
   * only if researcher (not editor, not admin)
 * edit
   * (only if current_user wrote the article)
   * can modify the content and abstract only (not the title)
   * can add authors (autocomplete which looks for user on the website)
   * if researcher and has been added as co-author to the article
 * delete
   * only if: author or co-author, paper is unpublished with no peer-reviews, or peer-reviews are started but after notification / need to give reason.

## Persons
 * (admin) see a list of all persons
 * (editor) see a list of all researchers and editors
 * (researcher) see a list of all researchers (and readers when adding authors? it will ask to change the status of the person)
 * (reader) see a list of all researchers

## Categories



## Reading List