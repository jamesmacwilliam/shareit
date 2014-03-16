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

ActiveRecord::Schema.define(version: 20140314130355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "addresses", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.uuid     "user_id"
    t.boolean  "default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "geographies", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "start_address_id"
    t.uuid     "end_address_id"
    t.string   "miles_to_travel"
    t.boolean  "willing_to_travel_across_state_line"
    t.string   "state_line_fee"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "user_id"
  end

  create_table "listings", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.datetime "listing_start"
    t.datetime "listing_end"
    t.string   "photos",        array: true
    t.string   "rate"
    t.string   "rate_type"
    t.string   "deposit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "geography_id"
    t.string   "desc"
    t.uuid     "user_id"
  end

  create_table "roles", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "tag_interests", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "tag_ids",      array: true
    t.uuid     "user_id"
    t.uuid     "geography_id"
    t.boolean  "default"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "desc"
  end

  create_table "taggings", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "tag_id"
    t.uuid     "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usages", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "listing_id"
    t.string   "units"
    t.uuid     "user_id"
    t.boolean  "completed"
    t.boolean  "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
