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

ActiveRecord::Schema.define(version: 2018_10_06_134443) do

  create_table "sessions", force: :cascade do |t|
    t.string "name"
    t.datetime "time"
    t.text "transcript"
    t.integer "task_ids"
    t.integer "users_id"
    t.integer "votes_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "details"
    t.text "invite"
    t.string "auth"
    t.string "state"
    t.index ["task_ids"], name: "index_sessions_on_task_ids"
    t.index ["votes_id"], name: "index_sessions_on_votes_id"
    t.index [nil], name: "index_sessions_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.string "link"
    t.index ["session_id"], name: "index_tasks_on_session_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "auth"
    t.string "phone"
    t.text "bio"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
  end

  create_table "votes", force: :cascade do |t|
    t.string "type"
    t.integer "task_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_votes_on_task_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

end
