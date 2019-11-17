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

ActiveRecord::Schema.define(version: 2019_11_17_055452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "comments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flaggable_flagged_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "flaggable_type", null: false
    t.uuid "flaggable_id", null: false
    t.integer "flagged_by_user_id"
    t.string "reason"
    t.string "preview"
    t.datetime "reviewed_at"
    t.datetime "reviewed_by_user_id"
    t.text "comments"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flaggable_type", "flaggable_id"], name: "idx_flagged_items_flaggable"
  end

end
