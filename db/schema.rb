# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_29_205857) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_users_on_category_id"
    t.index ["user_id"], name: "index_categories_users_on_user_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.bigint "gift_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "size"
    t.index ["gift_id"], name: "index_features_on_gift_id"
  end

  create_table "gift_links", force: :cascade do |t|
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "gift_id", null: false
    t.index ["gift_id"], name: "index_gift_links_on_gift_id"
  end

  create_table "gifts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.bigint "user_id"
    t.bigint "list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "url"
    t.string "size"
    t.string "assignee_email"
    t.index ["list_id"], name: "index_gifts_on_list_id"
    t.index ["user_id"], name: "index_gifts_on_user_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "code"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "event_date"
    t.string "photo_id"
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "views_count", default: 0
    t.bigint "user_id", null: false
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "featured", default: false
    t.date "event_date"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "user_gift_recomendations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "description"
    t.string "image"
    t.float "price"
    t.string "url"
    t.string "purchase_places"
    t.bigint "gift_id"
    t.bigint "list_id"
    t.string "assignee_email"
    t.index ["gift_id"], name: "index_user_gift_recomendations_on_gift_id"
    t.index ["list_id"], name: "index_user_gift_recomendations_on_list_id"
    t.index ["user_id"], name: "index_user_gift_recomendations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "categories_users", "categories"
  add_foreign_key "categories_users", "users"
  add_foreign_key "features", "gifts"
  add_foreign_key "gift_links", "gifts"
  add_foreign_key "gifts", "lists"
  add_foreign_key "gifts", "users"
  add_foreign_key "lists", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "user_gift_recomendations", "gifts"
  add_foreign_key "user_gift_recomendations", "lists"
  add_foreign_key "user_gift_recomendations", "users"
end
