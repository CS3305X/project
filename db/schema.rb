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

ActiveRecord::Schema.define(version: 0) do

  create_table "UserType", primary_key: "type_id", force: true do |t|
    t.string "type_name", limit: 15
  end
  
 create_table "User", primary_key: "user_id", force: true do |t|
    t.integer "user_type"
    t.string  "first_name",      limit: 30
    t.string  "last_name",       limit: 30
    t.string  "email",           limit: 60
    t.string  "phone_num",       limit: 30
    t.string  "password_digest", limit: 500
    t.boolean "activated",                   default: false
  end

  add_index "User", ["user_type"], name: "user_type", using: :btree
  
  create_table "PersonalEvent", primary_key: "event_id", force: true do |t|
    t.integer  "user_id"
    t.string   "event_name",  limit: 50
    t.string   "description", limit: 500
    t.string   "location",    limit: 100
    t.datetime "start_time"
    t.datetime "end_time"
  end

  add_index "PersonalEvent", ["user_id"], name: "user_id", using: :btree
  
  create_table "Module", primary_key: "module_code", force: true do |t|
    t.string  "description", limit: 200
    t.integer "lecturer_id"
  end

  add_index "Module", ["lecturer_id"], name: "lecturer_id", using: :btree
  
  create_table "RegisteredFor", id: false, force: true do |t|
    t.integer "user_id",                default: 0,  null: false
    t.string  "module_code", limit: 10, default: "", null: false
  end
  
  create_table "ClassSchedule", id: false, force: true do |t|
    t.string   "module_code", limit: 10,  default: "",    null: false
    t.datetime "start_time",                              null: false
    t.datetime "end_time"
    t.string   "location",    limit: 100
    t.boolean  "cancelled",               default: false
  end
  
  create_table "Course", primary_key: "course_id", force: true do |t|
    t.string "course_name", limit: 100
  end
  
  
  create_table "OfferedTo", id: false, force: true do |t|
    t.string "module_code", limit: 10, default: "", null: false
    t.string "course_id",   limit: 10, default: "", null: false
  end

  add_index "OfferedTo", ["course_id"], name: "course_id", using: :btree
  
  create_table "Meeting", primary_key: "meeting_id", force: true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "description",      limit: 100
    t.string   "location",         limit: 100
    t.integer  "organiser_id"
    t.boolean  "confirmed_by_all",             default: false
  end

  add_index "Meeting", ["organiser_id"], name: "organiser_id", using: :btree
  
  create_table "Attending", id: false, force: true do |t|
    t.integer "user_id",    default: 0,     null: false
    t.integer "meeting_id", default: 0,     null: false
    t.boolean "confirmed",  default: false
  end

  add_index "Attending", ["meeting_id"], name: "meeting_id", using: :btree

  create_table "UserGroup", primary_key: "group_id", force: true do |t|
    t.string  "group_name",  limit: 100
    t.string  "description", limit: 500
    t.integer "admin"
  end

  add_index "UserGroup", ["admin"], name: "admin", using: :btree

  create_table "MemberOf", id: false, force: true do |t|
    t.integer "user_id",  default: 0, null: false
    t.integer "group_id", default: 0, null: false
  end

  add_index "MemberOf", ["group_id"], name: "group_id", using: :btree



end
