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

ActiveRecord::Schema.define(version: 2022_03_06_040248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "learning_path_step_skills", force: :cascade do |t|
    t.bigint "learning_path_step_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["learning_path_step_id"], name: "index_learning_path_step_skills_on_learning_path_step_id"
    t.index ["skill_id"], name: "index_learning_path_step_skills_on_skill_id"
  end

  create_table "learning_path_steps", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "learning_path_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["learning_path_id"], name: "index_learning_path_steps_on_learning_path_id"
  end

  create_table "learning_paths", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skill_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.bigint "skill_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_type_id"], name: "index_skills_on_skill_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "linked_in"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "learning_path_step_skills", "learning_path_steps"
  add_foreign_key "learning_path_step_skills", "skills"
  add_foreign_key "learning_path_steps", "learning_paths"
  add_foreign_key "skills", "skill_types", on_delete: :cascade
end
