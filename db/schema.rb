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

ActiveRecord::Schema.define(version: 20190911183336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "character_revisions", force: :cascade do |t|
    t.integer "character_id"
    t.integer "spd_mod"
    t.integer "san_mod"
    t.integer "mgt_mod"
    t.integer "kno_mod"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.integer "unit_id"
    t.integer "stat_build_id"
    t.integer "speed"
    t.integer "might"
    t.integer "knowledge"
    t.integer "sanity"
    t.integer "discovery_points"
    t.integer "location_id"
    t.boolean "traitor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters_runs", id: false, force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "run_id", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "character_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "location_north_id"
    t.integer "location_south_id"
    t.integer "location_west_id"
    t.integer "location_east_id"
    t.integer "location_up_id"
    t.integer "location_down_id"
    t.boolean "discovered"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "runs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stat_builds", force: :cascade do |t|
    t.string "name"
    t.integer "spd_1"
    t.integer "spd_2"
    t.integer "spd_3"
    t.integer "spd_4"
    t.integer "spd_5"
    t.integer "spd_6"
    t.integer "spd_7"
    t.integer "spd_8"
    t.integer "san_1"
    t.integer "san_2"
    t.integer "san_3"
    t.integer "san_4"
    t.integer "san_5"
    t.integer "san_6"
    t.integer "san_7"
    t.integer "san_8"
    t.integer "mgt_1"
    t.integer "mgt_2"
    t.integer "mgt_3"
    t.integer "mgt_4"
    t.integer "mgt_5"
    t.integer "mgt_6"
    t.integer "mgt_7"
    t.integer "mgt_8"
    t.integer "kno_1"
    t.integer "kno_2"
    t.integer "kno_3"
    t.integer "kno_4"
    t.integer "kno_5"
    t.integer "kno_6"
    t.integer "kno_7"
    t.integer "kno_8"
    t.integer "spd_default"
    t.integer "san_default"
    t.integer "mgt_default"
    t.integer "kno_default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "location_id"
  end

end
