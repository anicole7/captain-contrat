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

ActiveRecord::Schema[7.0].define(version: 2023_08_02_141925) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "champions", force: :cascade do |t|
    t.string "name"
    t.integer "health_point"
    t.integer "attack_point"
    t.bigint "left_weapon_id"
    t.bigint "right_weapon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["left_weapon_id"], name: "index_champions_on_left_weapon_id"
    t.index ["right_weapon_id"], name: "index_champions_on_right_weapon_id"
  end

  create_table "fights", force: :cascade do |t|
    t.datetime "date"
    t.bigint "champion_1_id"
    t.bigint "champion_2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["champion_1_id"], name: "index_fights_on_champion_1_id"
    t.index ["champion_2_id"], name: "index_fights_on_champion_2_id"
  end

  create_table "turns", force: :cascade do |t|
    t.integer "number"
    t.integer "damage"
    t.integer "oponent_health_remaining"
    t.bigint "fight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fight_id"], name: "index_turns_on_fight_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.boolean "defensive"
    t.integer "weight"
    t.integer "stats_bonus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "champions", "weapons", column: "left_weapon_id"
  add_foreign_key "champions", "weapons", column: "right_weapon_id"
  add_foreign_key "fights", "champions", column: "champion_1_id"
  add_foreign_key "fights", "champions", column: "champion_2_id"
  add_foreign_key "turns", "fights"
end
