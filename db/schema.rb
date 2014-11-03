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

ActiveRecord::Schema.define(:version => 20141024170323) do

  create_table "assignments", :force => true do |t|
    t.integer "user_id"
    t.string  "user_type"
    t.integer "role_id"
  end

  add_index "assignments", ["user_id", "user_type"], :name => "index_assignments_on_user_id_and_user_type"

  create_table "crimes", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "departments", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "eventfiles", :force => true do |t|
    t.string   "upload"
    t.integer  "event_id"
    t.string   "uploader"
    t.boolean  "visible"
    t.text     "hide_reason"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.date     "upload_updated_at"
    t.string   "who_hide_file"
    t.text     "pdf_text"
  end

  create_table "events", :force => true do |t|
    t.integer  "priority"
    t.date     "event_date"
    t.text     "description"
    t.string   "address"
    t.string   "suburb"
    t.text     "observations"
    t.string   "source"
    t.string   "area"
    t.integer  "crime_id"
    t.integer  "township_id"
    t.integer  "locality_id"
    t.integer  "place_id"
    t.integer  "user_id"
    t.integer  "status_id"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "tramo_carretero"
    t.boolean  "visible"
    t.text     "reason_hide"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "gmaps"
  end

  create_table "localities", :force => true do |t|
    t.string   "description"
    t.integer  "township_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "ci"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "last_name2"
    t.string   "alias"
    t.date     "birth_date"
    t.string   "originative"
    t.string   "genre"
    t.boolean  "record"
    t.string   "profession"
    t.text     "observations"
    t.string   "status_id"
    t.string   "registered_from"
    t.text     "searchable"
    t.boolean  "visible"
    t.text     "hide_reason"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "event_id"
  end

  create_table "permissions", :force => true do |t|
    t.integer  "role_id"
    t.string   "name"
    t.string   "resource"
    t.string   "condition"
    t.boolean  "cannot"
    t.integer  "priority"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "permissions", ["name"], :name => "index_permissions_on_name"
  add_index "permissions", ["role_id", "name"], :name => "index_permissions_on_role_id_and_name"

  create_table "places", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "statuses", :force => true do |t|
    t.string   "description"
    t.string   "status_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "townships", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.boolean  "active"
    t.boolean  "admin"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "analyst_number"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "last_name2"
    t.integer  "area_id"
    t.integer  "department_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "vehicles", :force => true do |t|
    t.string   "brand"
    t.string   "line"
    t.integer  "model"
    t.string   "plate"
    t.string   "serial_number"
    t.string   "color"
    t.boolean  "stolen"
    t.string   "status"
    t.integer  "person_id"
    t.string   "registered_from"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
