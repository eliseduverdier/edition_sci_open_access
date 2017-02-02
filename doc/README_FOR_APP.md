<!--
Use this README file to introduce your application and point to useful places in the API for learning more.
Run "rake doc:app" to generate API documentation for your models, controllers, helpers, and libraries.
-->

# Overview
The site welcomes users, who can be readers, researchers or editors.

The researchers can submit their papers, which will wait for peer reviews.

The editors can read the submitted papers and

# Workflow

- between 3 and 5 reviews by article, proposed to researchers by same or different editors
- no one (except reviewer & admin) can read an unfinished review
- when all reviews (if >3) are each done:
  - froze the process, ask to editor to read reviews:
     - validate or refuse the paper (no status change (don't publish/refuse)).
  - send author a notif: "please correct your paper according to the reviews", or "sorry your paper has been rejected"
  - if ok: author corrects its paper and send notif to reviewer (process_status: done)
  - editor sees the changes: publishes paper !

*end*

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
    * -1: pending, not reviewed
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


## reviews
 * id
 * reviewer_id [people.id]
 * editor_id   [people.id]
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
   * if article is published: everyone can read the complete article
   * if article is unpublished (undergoing peer review):
     * a notice is displayed (this paper... currently under peer review, etc).
     * user might ask for a notification concerning its publication
     * **an editor** can read the whole paper, also sees the peer-review process. They can either ask for reviewer, ask for modification to the authors according to the reviews, and validate/refuse the paper when the process is done.
     * **a reviewer** can see the whole paper, their own review, and edit it (?)
     * **an author** they can edit the paper if the review process has not started. After, the corrections should be notified and validated by the editor.
 * new
   * only if researcher (not editor, not admin)
   * ask principal information about the paper. Asks a latex template, an odt template, or the online editor.
     * the online editor: based on `firepad` or similar software (see `ot.js`), for real-time collaborative editing, rich-form text, graphics, and tex (necessary, but feasible?) , history of who wrote what, diff between versions, etc.
 * edit
   * (only if current_user wrote the article)
   * can modify the content and abstract only (not the title)
   * can add authors (autocomplete which looks for user on the website)
   * if researcher and has been added as co-author to the article
 * delete
   * only if: author or co-author, paper is unpublished with no peer-reviews, or peer-reviews are started but after notification / need to give reason.

## Reviews
* **editor**
  * **paper/:id**
    * if pending, and not enough reviews already: can send reviews to researchers
    * if reviews are done: can accept/refuse the paper, but mostly sends it for modification to the author
  * **paper/:id** can validate or refuse an opinion paper (if pending)
  * **paper/:id/reviews** can see all the reviews of a paper
  * **paper/mine** can see all of the reviews they asked and which one are still pending
  * can see when all reviews are done, and asks to author
  * and decide to publish the paper.

* **researcher**
  on their articles:
  * **paper/:id/reviews**
    they can see all the finished reviews, for each round


  on other's article:
  * can edit a copy of the base article: their modification will be highligthed.




* **reader**
  * reviews are private: only editors, author of the article in question, and the reviewer can see them.

## Persons
 * (admin) see a list of all persons
 * (editor) see a list of all researchers and editors
 * (researcher) see a list of all researchers (and readers when adding authors? it will ask to change the status of the person)
 * (reader) see a list of all researchers

## Categories



## Reading List
