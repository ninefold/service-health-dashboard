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

ActiveRecord::Schema.define(:version => 20130510084359) do

  create_table "services", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "description"
    t.integer  "dependent_id"
    t.integer  "version"
    t.integer  "order"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "services", ["dependent_id"], :name => "index_services_on_dependent_id"

  create_table "severities", :force => true do |t|
    t.string   "name"
    t.integer  "val"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "description"
    t.integer  "severity_id"
    t.string   "image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "statuses", ["severity_id"], :name => "index_statuses_on_severity_id"

end
