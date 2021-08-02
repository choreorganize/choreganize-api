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

ActiveRecord::Schema.define(version: 2021_07_29_013106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.boolean "completed"
    t.bigint "roommate_id"
    t.bigint "chore_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chore_id"], name: "index_assignments_on_chore_id"
    t.index ["roommate_id"], name: "index_assignments_on_roommate_id"
  end

  create_table "chores", force: :cascade do |t|
    t.bigint "household_id"
    t.string "task_name"
    t.text "description"
    t.integer "weight"
    t.integer "frequency"
    t.boolean "outdoor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["household_id"], name: "index_chores_on_household_id"
  end

  create_table "households", force: :cascade do |t|
    t.string "address"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "state"
  end

  create_table "roommates", force: :cascade do |t|
    t.bigint "household_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email"
    t.string "google_id"
    t.string "token"
    t.index ["household_id"], name: "index_roommates_on_household_id"
  end

  add_foreign_key "assignments", "chores"
  add_foreign_key "assignments", "roommates"
  add_foreign_key "chores", "households"
  add_foreign_key "roommates", "households"
end
