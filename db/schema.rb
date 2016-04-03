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

ActiveRecord::Schema.define(version: 20160331075538) do


  create_table "accommodations", force: :cascade do |t|
    t.string   "accommodation_name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "account_id"
  end

  add_index "accommodations", ["account_id"], name: "index_accommodations_on_account_id"

  create_table "accounts", force: :cascade do |t|
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "password_digest"
    t.string   "current_address"
    t.string   "homephone"
    t.string   "cellphone"
    t.string   "emergency_contact_name"
    t.string   "emergency_phone"
    t.string   "emergency_phone_alternate"
    t.date     "DOB"
    t.boolean  "is_former_worker"
    t.boolean  "has_convictions"
    t.boolean  "need_accommodations"
    t.boolean  "related_to_councilmember"
    t.boolean  "is_current_worker"
    t.binary   "picture"
    t.binary   "driver_license"
    t.integer  "SSN"
    t.string   "middlename"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "maidenname"
    t.string   "string"
    t.string   "gender"
  end

  create_table "application_forms", force: :cascade do |t|
    t.string   "interested_areas"
    t.string   "volunteering_status"
    t.binary   "signature"
    t.datetime "application_date"
    t.datetime "available_time_begin"
    t.datetime "available_time_end"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "criminal_applications", force: :cascade do |t|
    t.integer  "mandatory_hours"
    t.string   "mandatory_area"
    t.datetime "deadlin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "current_workers", force: :cascade do |t|
    t.string   "name"
    t.string   "department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "account_id"
  end

  add_index "current_workers", ["account_id"], name: "index_current_workers_on_account_id"

  create_table "former_criminals", force: :cascade do |t|
    t.datetime "date_of_conviction"
    t.string   "nature_of_offense"
    t.string   "name_of_court"
    t.string   "disposition_of_case"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "former_crime"
    t.integer  "account_id"
  end

  add_index "former_criminals", ["account_id"], name: "index_former_criminals_on_account_id"

  create_table "minor_applications", force: :cascade do |t|
    t.binary   "parent_signature"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "related_councilmembers", force: :cascade do |t|
    t.string   "name"
    t.string   "relationship"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "account_id"
  end

  add_index "related_councilmembers", ["account_id"], name: "index_related_councilmembers_on_account_id"

  create_table "student_applications", force: :cascade do |t|
    t.string   "student_program"
    t.integer  "required_time"
    t.string   "required_area"
    t.datetime "deadline"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "user_formerworkers", force: :cascade do |t|
    t.datetime "date_of_employment"
    t.string   "reason_for_leaving"
    t.string   "position_or_department"
    t.string   "interested_area"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "account_id"
  end

  add_index "user_formerworkers", ["account_id"], name: "index_user_formerworkers_on_account_id"

end
