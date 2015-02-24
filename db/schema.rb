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

ActiveRecord::Schema.define(version: 20150224214252) do

  create_table "class_schedules", force: true do |t|
    t.string   "module_code"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "location"
    t.boolean  "cancelled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "course_id"
    t.string   "course_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "name",                        null: false
    t.datetime "start"
    t.datetime "finish"
    t.text     "description",                 null: false
    t.boolean  "all_day",     default: false, null: false
    t.integer  "user_id"
  end

  add_index "events", ["name"], name: "index_events_on_name", using: :btree

  create_table "meetings", force: true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "description"
    t.string   "location"
    t.integer  "organiser_id"
    t.boolean  "confirmed_by_all"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personal_events", force: true do |t|
    t.integer  "user_id"
    t.string   "event_name"
    t.string   "description"
    t.string   "location"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "personal_events", ["user_id"], name: "index_personal_events_on_user_id", using: :btree

  create_table "registered_fors", force: true do |t|
    t.integer  "user_id"
    t.string   "module_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "module_code"
    t.string   "description"
    t.integer  "lecturer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "credits"
  end

  create_table "user_groups", force: true do |t|
    t.string   "group_name"
    t.string   "description"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "user_type_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_num"
    t.string   "password_digest"
    t.boolean  "activated"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["user_type_id"], name: "index_users_on_user_type_id", using: :btree

  create_table "usertypes", force: true do |t|
    t.integer  "type_id"
    t.string   "type_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
