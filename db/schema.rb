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

ActiveRecord::Schema.define(version: 20150522211643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "credit_holders", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "address"
    t.string   "zip_code"
    t.string   "email_address"
    t.string   "contact_method"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.float    "credits_total",  default: 0.0
  end

  create_table "credits", force: :cascade do |t|
    t.datetime "expires_at"
    t.string   "status"
    t.integer  "credit_holder_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.float    "amount",           default: 0.0
    t.integer  "send_email"
    t.integer  "donate"
    t.integer  "num_books"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "credit_holder_id"
    t.float    "amount"
    t.integer  "donate"
    t.integer  "num_books"
    t.float    "amount_used"
    t.float    "amount_remaining"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "event"
    t.integer  "credit_id"
  end

end
