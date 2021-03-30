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

ActiveRecord::Schema.define(version: 2021_03_30_175506) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chefs", force: :cascade do |t|
    t.string "name"
    t.string "bio_link"
    t.string "job_title"
    t.bigint "season_id", null: false
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["season_id"], name: "index_chefs_on_season_id"
  end

  create_table "drafts", force: :cascade do |t|
    t.bigint "league_id", null: false
    t.datetime "starts_at"
    t.datetime "ended_at"
    t.json "pick_order"
    t.integer "current_pick_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["league_id"], name: "index_drafts_on_league_id"
  end

  create_table "episode_chefs", force: :cascade do |t|
    t.bigint "episode_id", null: false
    t.bigint "chef_id", null: false
    t.boolean "qf_win"
    t.boolean "qf_fav"
    t.boolean "elim_win"
    t.boolean "elim_top"
    t.boolean "elim_bottom"
    t.boolean "lck_win"
    t.boolean "lck_champ"
    t.boolean "champ"
    t.boolean "finale"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chef_id"], name: "index_episode_chefs_on_chef_id"
    t.index ["episode_id"], name: "index_episode_chefs_on_episode_id"
  end

  create_table "episodes", force: :cascade do |t|
    t.bigint "season_id", null: false
    t.integer "week"
    t.date "air_date"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "league_scoring_systems", force: :cascade do |t|
    t.bigint "league_id", null: false
    t.bigint "scoring_system_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["league_id"], name: "index_league_scoring_systems_on_league_id"
    t.index ["scoring_system_id"], name: "index_league_scoring_systems_on_scoring_system_id"
  end

  create_table "league_user_chefs", force: :cascade do |t|
    t.bigint "league_user_id", null: false
    t.bigint "chef_id", null: false
    t.integer "pick_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chef_id"], name: "index_league_user_chefs_on_chef_id"
    t.index ["league_user_id"], name: "index_league_user_chefs_on_league_user_id"
  end

  create_table "league_users", force: :cascade do |t|
    t.bigint "league_id", null: false
    t.bigint "user_id", null: false
    t.boolean "is_manager"
    t.string "team_name"
    t.float "total_points", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["league_id"], name: "index_league_users_on_league_id"
    t.index ["user_id"], name: "index_league_users_on_user_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.bigint "season_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "max_players"
    t.string "password_digest"
    t.string "guid"
    t.index ["season_id"], name: "index_leagues_on_season_id"
  end

  create_table "scoring_systems", force: :cascade do |t|
    t.decimal "qf_win_pts"
    t.decimal "qf_fav_pts"
    t.decimal "elim_win_pts"
    t.decimal "elim_top_pts"
    t.decimal "elim_bottom_pts"
    t.decimal "lck_win_pts"
    t.decimal "lck_champ_pts"
    t.decimal "champ_pts"
    t.decimal "finale_pts"
    t.decimal "sweep_pts"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "name"
    t.integer "season_year"
    t.integer "season_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "chefs", "seasons"
  add_foreign_key "drafts", "leagues"
  add_foreign_key "episode_chefs", "chefs"
  add_foreign_key "episode_chefs", "episodes"
  add_foreign_key "episodes", "seasons"
  add_foreign_key "league_scoring_systems", "leagues"
  add_foreign_key "league_scoring_systems", "scoring_systems"
  add_foreign_key "league_user_chefs", "chefs"
  add_foreign_key "league_user_chefs", "league_users"
  add_foreign_key "league_users", "leagues"
  add_foreign_key "league_users", "users"
  add_foreign_key "leagues", "seasons"
end
