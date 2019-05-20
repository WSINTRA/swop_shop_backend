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

ActiveRecord::Schema.define(version: 2019_05_20_181209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_items", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_cart_items_on_customer_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "customer_carts", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "cart_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_item_id"], name: "index_customer_carts_on_cart_item_id"
    t.index ["customer_id"], name: "index_customer_carts_on_customer_id"
  end

  create_table "customer_post_replies", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "post_id"
    t.bigint "reply_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_post_replies_on_customer_id"
    t.index ["post_id"], name: "index_customer_post_replies_on_post_id"
    t.index ["reply_id"], name: "index_customer_post_replies_on_reply_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "customer_id"
    t.integer "order_total"
    t.string "order_details"
    t.datetime "order_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_posts_on_customer_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "quantity"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
  end

  create_table "replies", force: :cascade do |t|
    t.string "content"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_replies_on_customer_id"
  end

  add_foreign_key "customer_carts", "cart_items"
  add_foreign_key "customer_carts", "customers"
  add_foreign_key "customer_post_replies", "customers"
  add_foreign_key "customer_post_replies", "posts"
  add_foreign_key "customer_post_replies", "replies"
end
