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

ActiveRecord::Schema.define(version: 20170313093329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calendar_entries", force: :cascade do |t|
    t.string   "modul"
    t.text     "description"
    t.string   "author"
    t.date     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "modul"
  end

  create_table "group_comments", force: :cascade do |t|
    t.integer  "group_document_id"
    t.string   "user_id"
    t.string   "comment"
    t.string   "tags"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "group_documents", force: :cascade do |t|
    t.string   "title"
    t.string   "user_id"
    t.text     "description"
    t.string   "modul"
    t.integer  "group"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "tags"
  end

  create_table "images", force: :cascade do |t|
    t.string   "title"
    t.string   "category"
    t.integer  "position"
    t.string   "date"
    t.string   "ratio"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "img_file_file_name"
    t.string   "img_file_content_type"
    t.integer  "img_file_file_size"
    t.datetime "img_file_updated_at"
  end

  create_table "user_requests", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "username",           default: "",    null: false
    t.string   "encrypted_password", default: "",    null: false
    t.integer  "sign_in_count",      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "admin",              default: false
    t.integer  "group",              default: 0
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

end
