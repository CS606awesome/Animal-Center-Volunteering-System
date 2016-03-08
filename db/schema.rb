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

ActiveRecord::Schema.define(version: 20160307230636) do

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
  end

end
