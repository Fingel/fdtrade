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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121221051207) do

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "houses", :force => true do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "address"
    t.string   "address2"
    t.string   "phone"
    t.integer  "department_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "battalion"
  end

  add_index "houses", ["battalion"], :name => "index_houses_on_battalion"
  add_index "houses", ["department_id"], :name => "index_houses_on_department_id"

  create_table "trades", :force => true do |t|
    t.datetime "date"
    t.boolean  "flipflop"
    t.boolean  "worktrade"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "trades", ["user_id", "date"], :name => "index_trades_on_user_id_and_date"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first"
    t.string   "last"
    t.string   "phone"
    t.string   "ident"
    t.integer  "house_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "rank"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["house_id"], :name => "index_users_on_house_id"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
