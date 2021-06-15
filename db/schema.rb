# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_13_060640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dep_names", force: :cascade do |t|
    t.string "dep"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.integer "idnum"
    t.string "name"
    t.bigint "dep_name_id"
    t.index ["dep_name_id"], name: "index_users_on_dep_name_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workschedules", force: :cascade do |t|
    t.date "wdate"
    t.bigint "user_id"
    t.bigint "status_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "body_temp_am"
    t.float "body_temp_pm"
    t.index ["status_id"], name: "index_workschedules_on_status_id"
    t.index ["user_id"], name: "index_workschedules_on_user_id"
  end

  add_foreign_key "users", "dep_names"
  add_foreign_key "workschedules", "statuses"
  add_foreign_key "workschedules", "users"
end
