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

ActiveRecord::Schema.define(version: 20180505065057) do

  create_table "catedra_surveys", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "catedra_id",                         null: false
    t.integer  "student_id",                         null: false
    t.decimal  "key",        precision: 2, scale: 1, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["catedra_id"], name: "index_catedra_surveys_on_catedra_id", using: :btree
    t.index ["student_id"], name: "index_catedra_surveys_on_student_id", using: :btree
  end

  create_table "catedras", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id",               null: false
    t.integer  "teacher_id",                null: false
    t.string   "title",                     null: false
    t.text     "description", limit: 65535
    t.string   "img",                       null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["category_id"], name: "index_catedras_on_category_id", using: :btree
    t.index ["teacher_id"], name: "index_catedras_on_teacher_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                     null: false
    t.string   "icon",                      null: false
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["title"], name: "index_categories_on_title", unique: true, using: :btree
  end

  create_table "clases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "catedra_id",                null: false
    t.string   "title",                     null: false
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["catedra_id"], name: "index_clases_on_catedra_id", using: :btree
  end

  create_table "notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "clase_id",                  null: false
    t.string   "title",                     null: false
    t.text     "description", limit: 65535, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["clase_id"], name: "index_notifications_on_clase_id", using: :btree
  end

  create_table "pivot_alumnos_catedras", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id", null: false
    t.integer  "catedra_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["catedra_id"], name: "index_pivot_alumnos_catedras_on_catedra_id", using: :btree
    t.index ["student_id"], name: "index_pivot_alumnos_catedras_on_student_id", using: :btree
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "key",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_roles_on_key", unique: true, using: :btree
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id", unique: true, using: :btree
  end

  create_table "teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teachers_on_user_id", unique: true, using: :btree
  end

  create_table "user_tokens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",        null: false
    t.string   "token_security", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_user_tokens_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre",     null: false
    t.string   "lastName",   null: false
    t.boolean  "gender",     null: false
    t.string   "email",      null: false
    t.integer  "role_id",    null: false
    t.string   "username",   null: false
    t.string   "password",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "catedra_surveys", "catedras"
  add_foreign_key "catedra_surveys", "students"
  add_foreign_key "catedras", "categories"
  add_foreign_key "catedras", "teachers"
  add_foreign_key "clases", "catedras"
  add_foreign_key "notifications", "clases"
  add_foreign_key "pivot_alumnos_catedras", "catedras"
  add_foreign_key "pivot_alumnos_catedras", "students"
  add_foreign_key "students", "users"
  add_foreign_key "teachers", "users"
  add_foreign_key "user_tokens", "users"
  add_foreign_key "users", "roles"
end
