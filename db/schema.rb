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

ActiveRecord::Schema.define(version: 20160428012519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expenses", force: :cascade do |t|
    t.string   "title",                                     null: false
    t.money    "total_amount",       scale: 2,              null: false
    t.integer  "total_person",                              null: false
    t.money    "responsible_amount", scale: 2
    t.money    "amount_payed",       scale: 2
    t.money    "amount_owed",        scale: 2
    t.string   "amount_with_who"
    t.boolean  "cleared"
    t.string   "comment"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "user_id",                                   null: false
    t.string   "participant",                  default: [],              array: true
    t.string   "p1"
    t.string   "p2"
    t.string   "p3"
    t.string   "p4"
    t.string   "p5"
    t.money    "a1",                 scale: 2
    t.money    "a2",                 scale: 2
    t.money    "a3",                 scale: 2
    t.money    "a4",                 scale: 2
    t.money    "a5",                 scale: 2
  end

  add_index "expenses", ["user_id"], name: "index_expenses_on_user_id", using: :btree

  create_table "participants", force: :cascade do |t|
    t.string   "name",                  null: false
    t.money    "paid_amount", scale: 2, null: false
    t.money    "net_amount",  scale: 2
    t.money    "owed_amount", scale: 2
    t.boolean  "required"
    t.integer  "expense_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "participants", ["expense_id"], name: "index_participants_on_expense_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "remember_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "expenses", "users"
  add_foreign_key "participants", "expenses"
end
