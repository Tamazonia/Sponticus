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

ActiveRecord::Schema.define(version: 20170817183949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "event_name"
    t.string   "event_category"
    t.text     "event_description"
    t.string   "event_address_title"
    t.string   "event_address_street"
    t.integer  "event_address_postalcode"
    t.string   "event_address_city"
    t.integer  "organizer_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "photo"
    t.date     "date"
    t.boolean  "initial_added_tickets"
    t.time     "event_time"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "event_link"
    t.index ["organizer_id"], name: "index_events_on_organizer_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "state"
    t.string   "ticket_sku"
    t.integer  "unit_price_cents", default: 0, null: false
    t.integer  "quantity"
    t.integer  "amount_cents",     default: 0, null: false
    t.json     "payment"
    t.integer  "ticket_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id"
    t.integer  "arrived"
    t.index ["ticket_id"], name: "index_orders_on_ticket_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "organizers", force: :cascade do |t|
    t.string   "organizer_name"
    t.string   "organizer_address_title"
    t.string   "organizer_address_street"
    t.integer  "organizer_address_postalcode"
    t.string   "organizer_address_city"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["user_id"], name: "index_organizers_on_user_id", using: :btree
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "amount_tickets_purchased"
    t.integer  "total_price"
    t.integer  "user_id"
    t.integer  "ticket_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["ticket_id"], name: "index_purchases_on_ticket_id", using: :btree
    t.index ["user_id"], name: "index_purchases_on_user_id", using: :btree
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "amount_tickets_to_sell"
    t.text     "ticket_details"
    t.integer  "event_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "amount_tickets_sold"
    t.integer  "amount_tickets_spare"
    t.string   "sku"
    t.integer  "price_cents",            default: 0, null: false
    t.index ["event_id"], name: "index_tickets_on_event_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "events", "organizers"
  add_foreign_key "orders", "tickets"
  add_foreign_key "orders", "users"
  add_foreign_key "organizers", "users"
  add_foreign_key "purchases", "tickets"
  add_foreign_key "purchases", "users"
  add_foreign_key "tickets", "events"
end
