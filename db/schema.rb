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

ActiveRecord::Schema.define(version: 20140303165205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meal_memberships", force: true do |t|
    t.integer  "menu_item_id"
    t.integer  "meal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meals", force: true do |t|
    t.integer  "diners"
    t.integer  "menu_id"
    t.integer  "table_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "duration"
    t.float    "price"
    t.float    "tip"
  end

  create_table "menu_items", force: true do |t|
    t.string  "name"
    t.float   "price"
    t.integer "section_id"
  end

  create_table "menus", force: true do |t|
    t.string  "name"
    t.integer "restaurant_id"
  end

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.string  "name"
    t.integer "menu_id"
  end

  create_table "tables", force: true do |t|
    t.integer "max_seats"
    t.integer "restaurant_id"
    t.integer "top"
    t.integer "left"
  end

end
