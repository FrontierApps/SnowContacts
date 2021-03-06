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

ActiveRecord::Schema.define(version: 20160617011210) do

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobnumbers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "JobNumber",   limit: 45
    t.integer  "contacts_id"
    t.integer  "sign_id"
    t.date     "DateStart"
    t.boolean  "Complete",                default: false
    t.string   "projectName", limit: 45
    t.string   "Rep",         limit: 45
    t.string   "RequestedBy", limit: 90
    t.string   "QuoteRef",    limit: 45
    t.date     "DueDate"
    t.string   "notes",       limit: 400
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["contacts_id"], name: "index_jobnumbers_on_contacts_id", using: :btree
    t.index ["sign_id"], name: "index_jobnumbers_on_sign_id", using: :btree
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
    t.index ["contact_id"], name: "index_locations_on_contact_id", using: :btree
  end

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
    t.index ["contact_id"], name: "index_people_on_contact_id", using: :btree
  end

  create_table "records", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "sign_id"
    t.string   "customerDesc"
    t.string   "solution"
    t.datetime "requestDate"
    t.datetime "finishDate"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["sign_id"], name: "index_records_on_sign_id", using: :btree
  end

  create_table "sign_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "sign_id"
    t.string   "detail"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["sign_id"], name: "index_sign_details_on_sign_id", using: :btree
  end

  create_table "signs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "contact_id"
    t.integer  "location_id"
    t.string   "signDesc"
    t.string   "signLoc"
    t.integer  "active",      limit: 1
    t.string   "builtBy"
    t.datetime "installDate"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["contact_id"], name: "index_signs_on_contact_id", using: :btree
    t.index ["location_id"], name: "index_signs_on_location_id", using: :btree
  end

  create_table "tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "taskname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timerecords", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "jobnumber"
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "timein"
    t.datetime "timeout"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "total",      limit: 24
  end

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
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "admin",                  limit: 1
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "active",                 limit: 1
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
