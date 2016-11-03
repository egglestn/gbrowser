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

ActiveRecord::Schema.define(version: 20161103161638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "developers", force: :cascade do |t|
    t.string   "company_name"
    t.string   "position"
    t.string   "head_office_address"
    t.string   "city"
    t.string   "county"
    t.string   "postcode"
    t.string   "email"
    t.string   "contact_number"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "developments", force: :cascade do |t|
    t.string   "development_name"
    t.integer  "developer_id"
    t.string   "office_address"
    t.string   "city"
    t.string   "county"
    t.string   "postcode"
    t.string   "email"
    t.string   "contact_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["developer_id"], name: "index_developments_on_developer_id", using: :btree
  end

  create_table "divisions", force: :cascade do |t|
    t.string  "division_name"
    t.string  "address"
    t.string  "city"
    t.string  "county"
    t.string  "postcode"
    t.string  "email"
    t.string  "contact_number"
    t.integer "developer_id"
    t.index ["developer_id"], name: "index_divisions_on_developer_id", using: :btree
  end

  create_table "finishes", force: :cascade do |t|
    t.integer  "room_id"
    t.string   "name"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
    t.index ["room_id"], name: "index_finishes_on_room_id", using: :btree
  end

  create_table "phases", force: :cascade do |t|
    t.string   "name"
    t.integer  "development_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["development_id"], name: "index_phases_on_development_id", using: :btree
  end

  create_table "plots", force: :cascade do |t|
    t.string   "prefix"
    t.integer  "number"
    t.integer  "unit_type_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["unit_type_id"], name: "index_plots_on_unit_type_id", using: :btree
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "unit_type_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["unit_type_id"], name: "index_rooms_on_unit_type_id", using: :btree
  end

  create_table "unit_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "phase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phase_id"], name: "index_unit_types_on_phase_id", using: :btree
  end

  add_foreign_key "developments", "developers"
  add_foreign_key "divisions", "developers"
  add_foreign_key "finishes", "rooms"
  add_foreign_key "phases", "developments"
  add_foreign_key "plots", "unit_types"
  add_foreign_key "rooms", "unit_types"
  add_foreign_key "unit_types", "phases"
end
