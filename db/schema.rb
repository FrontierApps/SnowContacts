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

ActiveRecord::Schema.define(version: 20160409221206) do

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
    t.string   "onsiteContactName"
    t.string   "Address"
    t.string   "Address1",          limit: 50
    t.string   "City",              limit: 50
    t.string   "StateOrProvince",   limit: 20
    t.string   "PostalCode",        limit: 20
    t.string   "WorkPhone",         limit: 30
    t.string   "FaxNumber",         limit: 30
    t.string   "notes"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "locations", ["contact_id"], name: "index_locations_on_contact_id", using: :btree

  create_table "people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "contact_id"
    t.string   "firstName",   limit: 50
    t.string   "lastName",    limit: 50
    t.string   "title",       limit: 50
    t.string   "mobilePhone", limit: 30
    t.string   "emailName",   limit: 50
    t.string   "notes"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "people", ["contact_id"], name: "index_people_on_contact_id", using: :btree

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                            default: "", null: false
    t.string   "encrypted_password",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "admin",                  limit: 1
    t.string   "firstname"
    t.string   "lastname"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
