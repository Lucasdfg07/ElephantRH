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

ActiveRecord::Schema.define(version: 2020_03_29_203843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "forms", force: :cascade do |t|
    t.bigint "patient_id"
    t.string "personal_moment"
    t.string "profissional_moment"
    t.string "interests"
    t.string "conclusions"
    t.string "intelectual_map", default: [], array: true
    t.string "personalities_characteristics", default: [], array: true
    t.string "facilities", default: [], array: true
    t.string "dificulties", default: [], array: true
    t.integer "psicological_concepts", default: [], array: true
    t.string "performance_diagnostic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_forms_on_patient_id"
  end

  create_table "office_visits", force: :cascade do |t|
    t.bigint "patient_id"
    t.date "date"
    t.string "hour"
    t.string "description"
    t.float "value"
    t.json "documents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_office_visits_on_patient_id"
  end

  create_table "parcels", force: :cascade do |t|
    t.bigint "office_visit_id"
    t.float "value"
    t.string "observation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_visit_id"], name: "index_parcels_on_office_visit_id"
  end

  create_table "patients", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "form_id"
    t.json "avatar"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company"
    t.string "marital_status"
    t.string "schooling"
    t.integer "age"
    t.string "office"
    t.integer "code"
    t.index ["form_id"], name: "index_patients_on_form_id"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "office_visits", "patients"
end
