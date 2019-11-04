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

ActiveRecord::Schema.define(version: 2019_11_04_172818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_assignments_on_role_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "carts", force: :cascade do |t|
    t.decimal "items", array: true
    t.string "user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "configs", force: :cascade do |t|
    t.string "property"
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locales", force: :cascade do |t|
    t.string "title"
    t.string "locale"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payment_systems", force: :cascade do |t|
    t.string "name"
    t.string "provider"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ppu_checkouts", force: :cascade do |t|
    t.string "fullname"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.string "products", array: true
    t.bigint "payment_system_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "ppu_transaction_id"
    t.index ["payment_system_id"], name: "index_ppu_checkouts_on_payment_system_id"
    t.index ["ppu_transaction_id"], name: "index_ppu_checkouts_on_ppu_transaction_id"
    t.index ["user_id"], name: "index_ppu_checkouts_on_user_id"
  end

  create_table "ppu_transactions", force: :cascade do |t|
    t.string "original"
    t.bigint "ppu_checkout_id", null: false
    t.decimal "payout"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ppu_checkout_id"], name: "index_ppu_transactions_on_ppu_checkout_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "price"
    t.string "photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "available"
  end

  create_table "purchases", force: :cascade do |t|
    t.string "cart"
    t.string "payment_method"
    t.decimal "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "assignments", "roles"
  add_foreign_key "assignments", "users"
  add_foreign_key "ppu_checkouts", "payment_systems"
  add_foreign_key "ppu_checkouts", "ppu_transactions"
  add_foreign_key "ppu_checkouts", "users"
  add_foreign_key "ppu_transactions", "ppu_checkouts"
end
