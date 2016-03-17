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

ActiveRecord::Schema.define(version: 20160314003853) do

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "FirstName",         limit: 50
    t.string   "LastName",          limit: 50
    t.string   "Dear",              limit: 50
    t.string   "Address"
    t.string   "Address1",          limit: 50
    t.string   "City",              limit: 50
    t.string   "StateOrProvince",   limit: 20
    t.string   "PostalCode",        limit: 20
    t.string   "Region",            limit: 50
    t.string   "Country",           limit: 50
    t.string   "CompanyName",       limit: 50
    t.string   "Title",             limit: 50
    t.string   "WorkPhone",         limit: 30
    t.string   "WorkExtension",     limit: 20
    t.string   "HomePhone",         limit: 30
    t.string   "MobilePhone",       limit: 30
    t.string   "FaxNumber",         limit: 30
    t.string   "EmailName",         limit: 50
    t.datetime "Birthdate"
    t.datetime "LastMeetingDate"
    t.integer  "ContactTypeID"
    t.string   "ReferredBy",        limit: 50
    t.text     "Notes",             limit: 4294967295
    t.string   "MaritalStatus",     limit: 20
    t.string   "SpouseName",        limit: 50
    t.string   "SpousesInterests"
    t.string   "ChildrenNames"
    t.string   "Hometown",          limit: 50
    t.string   "ContactsInterests"
    t.boolean  "Newsletter",                           default: false, null: false
    t.string   "Attn",              limit: 50
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "contact_id"
    t.string   "locationName"
    t.string   "Address"
    t.string   "Address1",        limit: 50
    t.string   "City",            limit: 50
    t.string   "StateOrProvince", limit: 20
    t.string   "PostalCode",      limit: 20
    t.string   "WorkPhone",       limit: 30
    t.string   "FaxNumber",       limit: 30
    t.boolean  "is_primary"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "locations", ["contact_id"], name: "index_locations_on_contact_id", using: :btree

  create_table "people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "location_id"
    t.string   "FirstName",   limit: 50
    t.string   "LastName",    limit: 50
    t.string   "Title",       limit: 50
    t.string   "MobilePhone", limit: 30
    t.string   "EmailName",   limit: 50
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "people", ["location_id"], name: "index_people_on_location_id", using: :btree

end
