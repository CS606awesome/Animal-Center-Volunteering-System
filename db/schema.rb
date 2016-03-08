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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160307231855) do
=======
ActiveRecord::Schema.define(version: 20160307230636) do
>>>>>>> master

  create_table "accounts", force: :cascade do |t|
    t.string  "email",                     limit: 255
    t.string  "firstname",                 limit: 255
    t.string  "lastname",                  limit: 255
    t.string  "password_digest",           limit: 255
    t.string  "current_address",           limit: 255
    t.string  "homephone",                 limit: 255
    t.string  "cellphone",                 limit: 255
    t.string  "emergency_contact_name",    limit: 255
    t.string  "emergency_phone",           limit: 255
    t.string  "emergency_phone_alternate", limit: 255
    t.date    "DOB"
    t.boolean "is_formal_worker",          limit: 1
    t.boolean "has_convicitons",           limit: 1
    t.boolean "need_accomendations",       limit: 1
    t.boolean "related_to_councilmember",  limit: 1
    t.boolean "is_current_worker",         limit: 1
    t.binary  "picture",                   limit: 16777215
    t.binary  "driver_license",            limit: 16777215
    t.integer "SSN",                       limit: 4
<<<<<<< HEAD
  end

  create_table "application_forms", force: :cascade do |t|
    t.string   "interested_areas",     limit: 255
    t.string   "volunteering_status",  limit: 255
    t.binary   "signature",            limit: 16777215
    t.datetime "application_date"
    t.datetime "available_time_begin"
    t.datetime "available_time_end"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "criminal_applications", force: :cascade do |t|
    t.integer  "mandatory_hours", limit: 4
    t.string   "mandatory_area",  limit: 255
    t.datetime "deadlin"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "minor_applications", force: :cascade do |t|
    t.binary   "parent_signature", limit: 16777215
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "student_applications", force: :cascade do |t|
    t.string   "student_program", limit: 255
    t.integer  "required_time",   limit: 4
    t.string   "required_area",   limit: 255
    t.datetime "deadline"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
=======
>>>>>>> master
  end

end
