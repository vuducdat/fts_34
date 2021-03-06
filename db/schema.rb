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

ActiveRecord::Schema.define(version: 20150715011434) do

  create_table "answers", force: :cascade do |t|
    t.string   "content"
    t.boolean  "is_correct"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "exetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "categories_id"
    t.boolean  "done",           default: false
    t.integer  "category_id"
    t.integer  "correct_number"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.datetime "finished"
    t.boolean  "checked",        default: false
  end

  add_index "exams", ["category_id"], name: "index_exams_on_category_id"
  add_index "exams", ["user_id"], name: "index_exams_on_user_id"

  create_table "questions", force: :cascade do |t|
    t.integer  "categories_id"
    t.string   "content"
    t.integer  "category_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "questions", ["category_id"], name: "index_questions_on_category_id"

  create_table "results", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "categories_id"
    t.integer  "exam_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "correct",       default: false
  end

  add_index "results", ["answer_id"], name: "index_results_on_answer_id"
  add_index "results", ["exam_id"], name: "index_results_on_exam_id"
  add_index "results", ["question_id"], name: "index_results_on_question_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "avatar"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.integer  "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "slug"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
