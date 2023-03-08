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

ActiveRecord::Schema.define(version: 2023_03_08_222739) do

  create_table "car_owners", force: :cascade do |t|
    t.integer "car_id", null: false
    t.integer "person_id", null: false
    t.date "date_of_sale"
    t.integer "price"
    t.integer "mileage_at_sale"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_car_owners_on_car_id"
    t.index ["person_id"], name: "index_car_owners_on_person_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "model"
    t.string "make"
    t.string "color"
    t.integer "mileage"
    t.boolean "is_for_sale"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "telephone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "car_owners", "cars"
  add_foreign_key "car_owners", "people"
end
