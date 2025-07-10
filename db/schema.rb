# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_07_10_161017) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "circuits", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "circuit_length"
    t.integer "capacity"
    t.integer "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "common_name"
    t.integer "number"
    t.string "nationality"
    t.date "birthday"
    t.integer "role"
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_drivers_on_team_id"
  end

  create_table "grand_prixes", force: :cascade do |t|
    t.string "name"
    t.bigint "circuit_id", null: false
    t.date "date"
    t.integer "total_laps"
    t.bigint "season_id", null: false
    t.integer "round"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circuit_id"], name: "index_grand_prixes_on_circuit_id"
    t.index ["season_id"], name: "index_grand_prixes_on_season_id"
  end

  create_table "results", force: :cascade do |t|
    t.bigint "grand_prix_id", null: false
    t.bigint "driver_id", null: false
    t.bigint "team_id", null: false
    t.integer "position"
    t.integer "points"
    t.integer "laps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_results_on_driver_id"
    t.index ["grand_prix_id"], name: "index_results_on_grand_prix_id"
    t.index ["team_id"], name: "index_results_on_team_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_principals", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "common_name"
    t.string "nationality"
    t.date "birthday"
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_principals_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "base"
    t.integer "founded"
    t.string "engine"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "drivers", "teams"
  add_foreign_key "grand_prixes", "circuits"
  add_foreign_key "grand_prixes", "seasons"
  add_foreign_key "results", "drivers"
  add_foreign_key "results", "grand_prixes"
  add_foreign_key "results", "teams"
  add_foreign_key "team_principals", "teams"
end
