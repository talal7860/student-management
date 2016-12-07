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

ActiveRecord::Schema.define(version: 20161202173255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "attendances", force: :cascade do |t|
    t.date     "date"
    t.uuid     "student_id"
    t.uuid     "course_id"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.uuid     "course_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "branches", force: :cascade do |t|
    t.string   "name"
    t.string   "branch_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", force: :cascade do |t|
    t.uuid     "course_id"
    t.uuid     "teacher_id"
    t.uuid     "student_id"
    t.integer  "exam_type"
    t.integer  "marks_obtained"
    t.integer  "total_marks"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "fees", force: :cascade do |t|
    t.string   "student_id"
    t.integer  "amount"
    t.date     "pay_date"
    t.integer  "scholarship"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "picture"
    t.integer  "class"
    t.date     "dob"
    t.string   "email"
    t.integer  "cnic"
    t.text     "address"
    t.integer  "studying_status"
    t.text     "teacher_remarks"
    t.uuid     "parent_id"
    t.uuid     "branch_id"
    t.integer  "matric_roll_no"
    t.integer  "matric_marks"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "teach_classes", force: :cascade do |t|
    t.uuid     "teacher_id"
    t.uuid     "student_id"
    t.uuid     "course_id"
    t.uuid     "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.string   "picture"
    t.string   "phone"
    t.string   "cnic"
    t.integer  "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end