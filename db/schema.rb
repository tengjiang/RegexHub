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

ActiveRecord::Schema.define(version: 20221108060031) do

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "regex_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["regex_id"], name: "index_likes_on_regex_id"
  add_index "likes", ["user_id", "regex_id"], name: "index_likes_on_user_id_and_regex_id", unique: true
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"


  create_table "regexes", force: :cascade do |t|
    t.string   "title"
    t.string   "expression"
    t.string   "description"
    t.string   "tag"
    t.datetime "created_at",  null: false
    t.integer  "user_id"
  end

  add_index "regexes", ["user_id"], name: "index_regexes_on_user_id"

  create_table "testcases", force: :cascade do |t|
    t.integer  "regex_id"
    t.string   "match"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "testcases", ["regex_id"], name: "index_testcases_on_regex_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
