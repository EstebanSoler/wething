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

ActiveRecord::Schema.define(version: 20130612132818) do

  create_table "companies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "things", force: true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_views_count", default: 0
  end

  add_index "things", ["company_id", "url"], name: "index_things_on_company_id_and_url", unique: true
  add_index "things", ["company_id"], name: "index_things_on_company_id"
  add_index "things", ["user_id"], name: "index_things_on_user_id"

  create_table "user_favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "thing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_favorites", ["thing_id"], name: "index_user_favorites_on_thing_id"
  add_index "user_favorites", ["user_id"], name: "index_user_favorites_on_user_id"

  create_table "user_views", force: true do |t|
    t.integer  "user_id"
    t.integer  "thing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_views", ["thing_id"], name: "index_user_views_on_thing_id"
  add_index "user_views", ["user_id"], name: "index_user_views_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
