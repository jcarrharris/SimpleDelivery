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

ActiveRecord::Schema.define(version: 20131009160645) do

  create_table "authentications", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesses", force: true do |t|
    t.string   "business_name"
    t.string   "website_url"
    t.integer  "phone_number"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "locations", force: true do |t|
    t.string   "location_name"
    t.string   "address"
    t.integer  "phone_number"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "business_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "tracking_number"
    t.string   "delivery_address"
    t.integer  "phone_number"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "location_id"
    t.integer  "length"
    t.integer  "width"
    t.integer  "height"
    t.integer  "weight"
    t.integer  "quantity"
    t.integer  "declared_value"
    t.string   "packaging"
    t.datetime "pickup_time"
    t.datetime "delivery_time"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

end
