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

ActiveRecord::Schema.define(version: 20150210113832) do

  create_table "attendings", force: true do |t|
    t.integer  "user_id"
    t.integer  "meeting_id"
    t.boolean  "confirmed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "meetings", force: true do |t|
    t.integer  "meeting_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "description"
    t.string   "location"
    t.integer  "organiser_id"
    t.boolean  "confirmed_by_all"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "member_ofs", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offered_tos", force: true do |t|
    t.string   "module_code"
    t.string   "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personal_events", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "event_name"
    t.string   "description"
    t.string   "location"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
  end

  create_table "user_groups", force: true do |t|
    t.integer  "group_id"
    t.string   "group_name"
    t.string   "description"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_types", force: true do |t|
    t.integer  "type_id"
    t.string   "type_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "user_id"
    t.integer  "user_type"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_num"
    t.string   "password_digest"
    t.boolean  "activated"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
