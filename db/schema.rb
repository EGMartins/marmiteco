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

ActiveRecord::Schema.define(version: 20170826030038) do

  create_table "businesses", force: :cascade do |t|
    t.string   "business_name",     limit: 150, null: false
    t.text     "business_info",     limit: 450, null: false
    t.string   "business_time",     limit: 150, null: false
    t.string   "business_street",   limit: 150, null: false
    t.string   "business_number",   limit: 30,  null: false
    t.string   "business_neighbor", limit: 50,  null: false
    t.string   "business_city",     limit: 100, null: false
    t.string   "business_state",    limit: 2,   null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "business_phone"
    t.string   "address"
    t.string   "sunday"
    t.string   "monday"
    t.string   "tuesday"
    t.string   "wednesday"
    t.string   "thursday"
    t.string   "friday"
    t.string   "saturday"
    t.boolean  "active"
    t.index ["user_id"], name: "index_businesses_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "price"
    t.string   "status"
    t.string   "buyer_name"
    t.string   "reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.date     "end_date"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.decimal  "price"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 100, null: false
    t.string   "email",           limit: 100, null: false
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
