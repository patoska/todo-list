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

ActiveRecord::Schema[8.0].define(version: 2025_08_28_154512) do
  create_table "to_dos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.datetime "due_on"
    t.bigint "notify_id", null: false
    t.string "notes"
    t.bigint "added_by_id", null: false
    t.bigint "assigned_to_id", null: false
    t.datetime "date_completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["added_by_id"], name: "index_to_dos_on_added_by_id"
    t.index ["assigned_to_id"], name: "index_to_dos_on_assigned_to_id"
    t.index ["notify_id"], name: "index_to_dos_on_notify_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "position"
    t.text "avatar", size: :long
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "to_dos", "users", column: "added_by_id"
  add_foreign_key "to_dos", "users", column: "assigned_to_id"
  add_foreign_key "to_dos", "users", column: "notify_id"
end
