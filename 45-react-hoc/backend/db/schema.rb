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

ActiveRecord::Schema.define(version: 20180726174654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients_recipes", id: false, force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "ingredient_id", null: false
    t.index ["ingredient_id", "recipe_id"], name: "index_ingredients_recipes_on_ingredient_id_and_recipe_id"
    t.index ["recipe_id", "ingredient_id"], name: "index_ingredients_recipes_on_recipe_id_and_ingredient_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.string "href"
    t.string "thumbnail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ingredients"
  end

  create_table "recipes_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "recipe_id", null: false
    t.index ["recipe_id", "user_id"], name: "index_recipes_users_on_recipe_id_and_user_id"
    t.index ["user_id", "recipe_id"], name: "index_recipes_users_on_user_id_and_recipe_id"
  end

  create_table "snacks", force: :cascade do |t|
    t.string "name"
  end

  create_table "snacks_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "snack_id", null: false
    t.index ["snack_id", "user_id"], name: "index_snacks_users_on_snack_id_and_user_id"
    t.index ["user_id", "snack_id"], name: "index_snacks_users_on_user_id_and_snack_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
