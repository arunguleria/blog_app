# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140104053307) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["author_id"], name: "index_articles_on_author_id", using: :btree
  add_index "articles", ["id"], name: "index_articles_on_id", using: :btree
  add_index "articles", ["title"], name: "index_articles_on_title", using: :btree

  create_table "authors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authors", ["email"], name: "index_authors_on_email", using: :btree
  add_index "authors", ["id"], name: "index_authors_on_id", using: :btree

  create_table "comments", force: true do |t|
    t.string   "comment"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
  add_index "comments", ["id"], name: "index_comments_on_id", using: :btree

  create_table "profiles", force: true do |t|
    t.string   "date_of_birth"
    t.string   "website"
    t.string   "facebook_page"
    t.string   "github_url"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["author_id"], name: "index_profiles_on_author_id", using: :btree
  add_index "profiles", ["facebook_page"], name: "index_profiles_on_facebook_page", using: :btree
  add_index "profiles", ["github_url"], name: "index_profiles_on_github_url", using: :btree
  add_index "profiles", ["id"], name: "index_profiles_on_id", using: :btree
  add_index "profiles", ["website"], name: "index_profiles_on_website", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["id"], name: "index_users_on_id", using: :btree

end
