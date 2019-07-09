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

ActiveRecord::Schema.define(version: 2019_07_08_092422) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_theaters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.bigint "theater_id"
    t.bigint "movie_id"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_movie_theaters_on_movie_id"
    t.index ["theater_id"], name: "index_movie_theaters_on_theater_id"
  end

  create_table "movies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.boolean "available"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_movies_on_category_id"
  end

  create_table "order_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.bigint "movie_theater_id"
    t.bigint "order_id"
    t.bigint "seat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_theater_id"], name: "index_order_items_on_movie_theater_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["seat_id"], name: "index_order_items_on_seat_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "theater_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["theater_id"], name: "index_rooms_on_theater_id"
  end

  create_table "seats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "room_id"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_seats_on_room_id"
  end

  create_table "theaters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_theaters_on_city_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "movie_theaters", "movies"
  add_foreign_key "movie_theaters", "theaters"
  add_foreign_key "movies", "categories"
  add_foreign_key "order_items", "movie_theaters"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "seats"
  add_foreign_key "orders", "users"
  add_foreign_key "rooms", "theaters"
  add_foreign_key "theaters", "cities"
end
