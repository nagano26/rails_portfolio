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

ActiveRecord::Schema[7.0].define(version: 2022_05_10_104545) do
  create_table "blogs", force: :cascade do |t|
    t.integer "user_id"
    t.string "title_blog"
    t.text "body_blog"
    t.string "blog_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comment_lifestyles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "lifestyle_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comment_works", force: :cascade do |t|
    t.integer "user_id"
    t.integer "work_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "normal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "talk_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["talk_id"], name: "index_entries_on_talk_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "good_lifestyles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "lifestyle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "good_normals", force: :cascade do |t|
    t.integer "user_id"
    t.integer "normal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "good_works", force: :cascade do |t|
    t.integer "user_id"
    t.integer "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lifestyles", force: :cascade do |t|
    t.integer "user_id"
    t.string "price_life"
    t.text "house_life"
    t.text "dating_life"
    t.text "system_life"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "talk_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["talk_id"], name: "index_messages_on_talk_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "normals", force: :cascade do |t|
    t.integer "user_id"
    t.string "before_address"
    t.string "current_address"
    t.text "trigger"
    t.text "preparation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "visitor_id", null: false
    t.integer "visited_id", null: false
    t.integer "talk_id"
    t.integer "comment_id"
    t.string "action", default: "", null: false
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "message_id"
    t.integer "normal_id"
    t.integer "comment_work_id"
    t.integer "comment_lifestyle_id"
    t.index ["comment_id"], name: "index_notifications_on_comment_id"
    t.index ["comment_lifestyle_id"], name: "index_notifications_on_comment_lifestyle_id"
    t.index ["comment_work_id"], name: "index_notifications_on_comment_work_id"
    t.index ["message_id"], name: "index_notifications_on_message_id"
    t.index ["normal_id"], name: "index_notifications_on_normal_id"
    t.index ["talk_id"], name: "index_notifications_on_talk_id"
    t.index ["visited_id"], name: "index_notifications_on_visited_id"
    t.index ["visitor_id"], name: "index_notifications_on_visitor_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.date "start_at"
    t.date "end_at"
    t.integer "number_people"
    t.string "total_day"
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rides", force: :cascade do |t|
    t.integer "ride_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "user_id"
    t.string "room_name"
    t.text "room_body"
    t.integer "room_price"
    t.string "address"
    t.string "room_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "talks", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username", null: false
    t.text "profile"
    t.string "profile_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.integer "user_id"
    t.string "before_work"
    t.string "current_work"
    t.string "others_work"
    t.text "message_work"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "entries", "talks"
  add_foreign_key "entries", "users"
  add_foreign_key "messages", "talks"
  add_foreign_key "messages", "users"
end
