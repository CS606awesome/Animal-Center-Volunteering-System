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

ActiveRecord::Schema.define(version: 20160420233732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.string   "accommodation_name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "account_id"
  end

  add_index "accommodations", ["account_id"], name: "index_accommodations_on_account_id", using: :btree

  create_table "accounts", force: :cascade do |t|
    t.string  "email"
    t.string  "firstname"
    t.string  "lastname"
    t.string  "password_digest"
    t.string  "homephone"
    t.string  "cellphone"
    t.string  "emergency_contact_name"
    t.string  "emergency_phone"
    t.string  "emergency_phone_alternate"
    t.date    "DOB"
    t.binary  "picture"
    t.binary  "driver_license"
    t.integer "SSN"
    t.string  "middlename"
    t.string  "maidenname"
    t.string  "gender"
    t.string  "country"
    t.string  "state"
    t.string  "city"
    t.string  "street"
    t.string  "zip"
    t.boolean "status"
    t.boolean "is_volunteering",           default: false
    t.boolean "submit_bcheck",             default: false
    t.boolean "is_former_worker",          default: false
    t.boolean "has_convictions",           default: false
    t.boolean "is_student",                default: false
    t.boolean "need_accommodations",       default: false
    t.boolean "related_to_councilmember",  default: false
    t.boolean "is_current_worker",         default: false
  end

  create_table "admins", force: :cascade do |t|
    t.string   "password_digest"
    t.string   "email"
    t.string   "key"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "application_forms", force: :cascade do |t|
    t.string   "interested_areas"
    t.binary   "signature"
    t.datetime "available_time_begin"
    t.datetime "available_time_end"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "account_id"
  end

  add_index "application_forms", ["account_id"], name: "index_application_forms_on_account_id", using: :btree

  create_table "criminal_applications", force: :cascade do |t|
    t.integer  "mandatory_hours"
    t.string   "mandatory_area"
    t.datetime "deadline"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "account_id"
  end

  add_index "criminal_applications", ["account_id"], name: "index_criminal_applications_on_account_id", using: :btree

  create_table "current_workers", force: :cascade do |t|
    t.string   "name"
    t.string   "department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "account_id"
  end

  create_table "former_criminals", force: :cascade do |t|
    t.datetime "date_of_conviction"
    t.string   "nature_of_offense"
    t.string   "name_of_court"
    t.string   "disposition_of_case"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "account_id"
    t.string   "former_crime"
  end

  add_index "former_criminals", ["account_id"], name: "index_former_criminals_on_account_id", using: :btree

  create_table "minor_applications", force: :cascade do |t|
    t.binary   "parent_signature"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "account_id"
  end

  add_index "minor_applications", ["account_id"], name: "index_minor_applications_on_account_id", using: :btree

  create_table "related_councilmembers", force: :cascade do |t|
    t.string   "name"
    t.string   "relationship"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "account_id"
  end

  add_index "related_councilmembers", ["account_id"], name: "index_related_councilmembers_on_account_id", using: :btree

  create_table "student_applications", force: :cascade do |t|
    t.string   "student_program"
    t.integer  "required_time"
    t.string   "required_area"
    t.datetime "deadline"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "account_id"
  end

  add_index "student_applications", ["account_id"], name: "index_student_applications_on_account_id", using: :btree

  create_table "user_formerworkers", force: :cascade do |t|
    t.datetime "date_of_employment"
    t.string   "reason_for_leaving"
    t.string   "position_or_department"
    t.string   "interested_area"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "account_id"
  end

  add_index "user_formerworkers", ["account_id"], name: "index_user_formerworkers_on_account_id", using: :btree

  add_foreign_key "accommodations", "accounts"
  add_foreign_key "application_forms", "accounts"
  add_foreign_key "criminal_applications", "accounts"
  add_foreign_key "current_workers", "accounts"
  add_foreign_key "former_criminals", "accounts"
  add_foreign_key "minor_applications", "accounts"
  add_foreign_key "related_councilmembers", "accounts"
  add_foreign_key "student_applications", "accounts"
  add_foreign_key "user_formerworkers", "accounts"
end
