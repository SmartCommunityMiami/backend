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

ActiveRecord::Schema.define(version: 20170426015704) do

  create_table "departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",         default: "", null: false
    t.string   "email",        default: "", null: false
    t.string   "phone",        default: "", null: false
    t.string   "organization", default: "", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "issues", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "description",   default: "", null: false
    t.integer  "department_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["department_id"], name: "index_issues_on_department_id", using: :btree
  end

  create_table "reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "issue_id"
    t.integer  "user_id"
    t.string   "description",              default: "", null: false
    t.string   "picture_link",             default: "", null: false
    t.float    "latitude",      limit: 24,              null: false
    t.float    "longitude",     limit: 24,              null: false
    t.date     "date_resolved"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["issue_id"], name: "index_reports_on_issue_id", using: :btree
    t.index ["user_id"], name: "index_reports_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username",               default: "",    null: false
    t.string   "first_name",             default: "",    null: false
    t.string   "last_name",              default: "",    null: false
    t.string   "auth_token",             default: ""
    t.boolean  "isAdmin",                default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["auth_token"], name: "index_users_on_auth_token", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "votes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "report_id"
    t.integer  "user_id"
    t.integer  "direction",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_votes_on_report_id", using: :btree
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
  end

  add_foreign_key "issues", "departments"
  add_foreign_key "reports", "issues"
  add_foreign_key "reports", "users"
  add_foreign_key "votes", "reports"
  add_foreign_key "votes", "users"
end
