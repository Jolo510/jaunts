# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140806061417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: true do |t|
    t.string   "yelp_id"
    t.string   "name"
    t.binary   "image"
    t.string   "display_phone"
    t.integer  "review_count"
    t.binary   "rating_img"
    t.string   "snippet_text"
    t.string   "location_address"
    t.string   "location_city"
    t.string   "location_state"
    t.string   "location_postal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  create_table "trips", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "json"
    t.string   "user_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "email"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image"
    t.string   "location"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
