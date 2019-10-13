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

ActiveRecord::Schema.define(version: 2019_10_13_123637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "factories", force: :cascade do |t|
    t.integer "player_id"
    t.integer "level"
    t.integer "upkeep"
    t.index ["player_id"], name: "index_factories_on_player_id"
  end

  create_table "houses", force: :cascade do |t|
    t.integer "player_id"
    t.integer "level"
    t.integer "upkeep"
    t.index ["player_id"], name: "index_houses_on_player_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "kind"
    t.integer "quantity"
    t.integer "modifier"
    t.string "modified_attribute"
    t.integer "price"
    t.integer "player_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_items_on_player_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "will_needed"
    t.integer "sub_skill_needed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "current_date"
    t.integer "wallet_amount"
    t.integer "energy"
    t.string "firstname"
    t.string "lastname"
    t.string "title"
    t.integer "gender"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "seduction"
    t.integer "intimidation"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "sissies", force: :cascade do |t|
    t.integer "player_id"
    t.string "firstname"
    t.string "lastname"
    t.datetime "birthdate"
    t.string "surname"
    t.integer "height"
    t.integer "weight"
    t.integer "hair_length"
    t.integer "hair_color"
    t.integer "eyes_color"
    t.integer "skin_color"
    t.integer "penis_size"
    t.integer "testicles_size"
    t.integer "breasts_size"
    t.integer "ass_size"
    t.integer "lips_size"
    t.integer "feminity"
    t.integer "will"
    t.integer "oral_skill"
    t.integer "anal_skill"
    t.integer "sub_skill"
    t.integer "attractiveness"
    t.boolean "owned", default: false
    t.integer "location"
    t.index ["location"], name: "index_sissies_on_location"
    t.index ["player_id"], name: "index_sissies_on_player_id"
  end

  create_table "sissy_jobs", force: :cascade do |t|
    t.integer "sissy_id"
    t.integer "job_id"
    t.integer "experience"
    t.boolean "current_job"
    t.index ["job_id"], name: "index_sissy_jobs_on_job_id"
    t.index ["sissy_id", "job_id"], name: "index_sissy_jobs_on_sissy_id_and_job_id", unique: true
    t.index ["sissy_id"], name: "index_sissy_jobs_on_sissy_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
