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

ActiveRecord::Schema.define(version: 20150310193400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "disciplines", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "disciplines", ["name"], name: "index_disciplines_on_name", unique: true, using: :btree

  create_table "first_names", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "first_names", ["name"], name: "index_first_names_on_name", unique: true, using: :btree

  create_table "grades", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "semester_id"
    t.integer  "discipline_id"
    t.decimal  "grade_value",   precision: 8, scale: 2
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "grades", ["discipline_id"], name: "index_grades_on_discipline_id", using: :btree
  add_index "grades", ["grade_value"], name: "index_grades_on_grade_value", using: :btree
  add_index "grades", ["semester_id"], name: "index_grades_on_semester_id", using: :btree
  add_index "grades", ["student_id"], name: "index_grades_on_student_id", using: :btree

  create_table "last_names", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "last_names", ["name"], name: "index_last_names_on_name", unique: true, using: :btree

  create_table "semesters", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "semesters", ["name"], name: "index_semesters_on_name", unique: true, using: :btree

  create_table "student_groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "student_groups", ["name"], name: "index_student_groups_on_name", unique: true, using: :btree

  create_table "students", force: :cascade do |t|
    t.integer  "first_name_id"
    t.integer  "last_name_id"
    t.string   "first_name_value"
    t.string   "last_name_value"
    t.date     "birthdate"
    t.string   "email"
    t.datetime "registration_time"
    t.string   "registration_ip"
    t.integer  "student_group_id"
    t.decimal  "average_grade_value", precision: 8, scale: 2
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "students", ["average_grade_value"], name: "index_students_on_average_grade_value", using: :btree
  add_index "students", ["first_name_id"], name: "index_students_on_first_name_id", using: :btree
  add_index "students", ["last_name_id", "average_grade_value", "student_group_id"], name: "complex_index", using: :btree
  add_index "students", ["registration_ip"], name: "index_students_on_registration_ip", using: :btree
  add_index "students", ["student_group_id"], name: "index_students_on_student_group_id", using: :btree

  add_foreign_key "grades", "disciplines"
  add_foreign_key "grades", "semesters"
  add_foreign_key "grades", "students"
end
