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

ActiveRecord::Schema.define(version: 20160623193228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "body",        null: false
    t.integer  "question_id", null: false
    t.integer  "reaction_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cstrengths", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.string   "concepts",    null: false
    t.integer  "tag_id",      null: false
    t.string   "exercise1",   null: false
    t.string   "exercise2",   null: false
    t.string   "motto",       null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cstrengths_questions", force: :cascade do |t|
    t.integer  "question_id",   null: false
    t.integer  "cstrengths_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reactions", force: :cascade do |t|
    t.integer  "cstrength_id",                   null: false
    t.integer  "user_id",                        null: false
    t.float    "sentiment_rating", default: 0.0, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tones", force: :cascade do |t|
    t.integer  "reaction_id",       null: false
    t.integer  "user_id",           null: false
    t.float    "anger",             null: false
    t.float    "disgust",           null: false
    t.float    "fear",              null: false
    t.float    "joy",               null: false
    t.float    "sadness",           null: false
    t.float    "analytical",        null: false
    t.float    "confidence",        null: false
    t.float    "tentative",         null: false
    t.float    "openess",           null: false
    t.float    "conscientiousness", null: false
    t.float    "extraversion",      null: false
    t.float    "agreableness",      null: false
    t.float    "emotional_range",   null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "phone_number"
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
