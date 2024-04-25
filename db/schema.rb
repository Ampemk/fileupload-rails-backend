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

ActiveRecord::Schema[7.0].define(version: 2024_04_25_010206) do
  create_table "addresses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.bigint "restaurant_id"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city", "state"], name: "index_addresses_on_city_and_state"
    t.index ["owner_id"], name: "index_addresses_on_owner_id"
    t.index ["restaurant_id"], name: "index_addresses_on_restaurant_id"
    t.index ["zip_code"], name: "index_addresses_on_zip_code"
  end

  create_table "inspections", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "inspection_score"
    t.string "inspection_type"
    t.string "risk_category"
    t.text "description"
    t.integer "violation_type"
    t.date "inspection_date"
    t.date "violation_date"
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_inspections_on_restaurant_id"
    t.index ["violation_type"], name: "index_inspections_on_violation_type"
  end

  create_table "owners", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_owners_on_name"
  end

  create_table "restaurants", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "phone"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_restaurants_on_name"
    t.index ["owner_id"], name: "index_restaurants_on_owner_id"
  end

  add_foreign_key "addresses", "owners"
  add_foreign_key "addresses", "restaurants"
  add_foreign_key "inspections", "restaurants"
  add_foreign_key "restaurants", "owners"
end
