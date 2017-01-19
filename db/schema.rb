# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170119142427) do

  create_table "authors", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "paper_id"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paper_id"], name: "index_authors_on_paper_id"
    t.index ["person_id"], name: "index_authors_on_person_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "parent_category"
  end

  create_table "papers", force: :cascade do |t|
    t.string   "paper_type"
    t.string   "title"
    t.text     "abstract"
    t.string   "status"
    t.datetime "publication_date"
    t.text     "tex_content"
    t.text     "html_content"
    t.string   "pdf_url"
    t.integer  "category_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "uuid"
    t.string   "conflict_of_interest"
    t.string   "licence"
    t.string   "doi"
    t.string   "keywords"
    t.datetime "accepted_at"
    t.index ["category_id"], name: "index_papers_on_category_id"
  end

  create_table "people", force: :cascade do |t|
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "status"
    t.text     "bio"
    t.text     "level"
    t.string   "country"
    t.string   "academia_url"
    t.string   "research_gate_url"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "password"
    t.string   "university"
    t.string   "academic_status"
    t.string   "password_digest"
    t.string   "activation_digest"
    t.boolean  "activated"
    t.datetime "activated_at"
    t.index ["email"], name: "index_people_on_email", unique: true
  end

  create_table "reading_list_folders", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reading_lists", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "paper_id"
    t.integer  "reading_list_folder_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["paper_id"], name: "index_reading_lists_on_paper_id"
    t.index ["person_id"], name: "index_reading_lists_on_person_id"
    t.index ["reading_list_folder_id"], name: "index_reading_lists_on_reading_list_folder_id"
  end

  create_table "reviewers", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "paper_id"
    t.string   "status"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "progression"
    t.string   "uuid"
    t.index ["paper_id"], name: "index_reviewers_on_paper_id"
    t.index ["person_id"], name: "index_reviewers_on_person_id"
  end

end