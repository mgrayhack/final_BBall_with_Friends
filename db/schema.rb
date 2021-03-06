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

ActiveRecord::Schema.define(version: 2021_03_16_213224) do

  create_table "games", force: :cascade do |t|
    t.datetime "date"
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.integer "spread"
    t.string "result"
    t.integer "wagers_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "standings", force: :cascade do |t|
    t.integer "player_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.integer "wins"
    t.integer "losses"
    t.string "username"
    t.integer "wagers_count"
    t.integer "taker_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wagers", force: :cascade do |t|
    t.string "selected_team"
    t.string "opponent"
    t.integer "spread"
    t.integer "bet_user_id"
    t.integer "taker_of_bet_id"
    t.string "result"
    t.integer "game_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date_of_game"
  end

end
