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

ActiveRecord::Schema.define(:version => 20121105210546) do

  create_table "gauges", :force => true do |t|
    t.string   "units"
    t.string   "type"
    t.string   "code"
    t.decimal  "lat"
    t.decimal  "lng"
    t.integer  "river"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "gauges", ["code"], :name => "sqlite_autoindex_gauges_1", :unique => true

  create_table "people", :force => true do |t|
    t.string   "username"
    t.string   "first"
    t.string   "last"
    t.string   "email"
    t.string   "salt"
    t.string   "encrypted_password"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "rapids", :force => true do |t|
    t.string   "name"
    t.integer  "class"
    t.integer  "river"
    t.decimal  "lat"
    t.decimal  "lng"
    t.text     "description"
    t.text     "user_created"
    t.text     "user_changed"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "rivers", :force => true do |t|
    t.string   "name"
    t.string   "user"
    t.date     "date_added"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.integer  "person_id"
    t.string   "ip_address"
    t.string   "ppath"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
