# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_06_220742) do

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "height"
    t.integer "mass"
    t.string "hair_color"
    t.string "skin_color"
    t.string "eye_color"
    t.string "birth_year"
    t.string "gender"
    t.string "url"
    t.integer "planet_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["planet_id"], name: "index_characters_on_planet_id"
  end

  create_table "chars_films", force: :cascade do |t|
    t.integer "film_id"
    t.integer "character_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_chars_films_on_character_id"
    t.index ["film_id"], name: "index_chars_films_on_film_id"
  end

  create_table "chars_species", force: :cascade do |t|
    t.integer "character_id"
    t.integer "specie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_chars_species_on_character_id"
    t.index ["specie_id"], name: "index_chars_species_on_specie_id"
  end

  create_table "chars_starships", force: :cascade do |t|
    t.integer "character_id"
    t.integer "starship_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_chars_starships_on_character_id"
    t.index ["starship_id"], name: "index_chars_starships_on_starship_id"
  end

  create_table "chars_vehicles", force: :cascade do |t|
    t.integer "character_id"
    t.integer "vehicle_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_chars_vehicles_on_character_id"
    t.index ["vehicle_id"], name: "index_chars_vehicles_on_vehicle_id"
  end

  create_table "data_importations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "films", force: :cascade do |t|
    t.string "title"
    t.integer "episode_num"
    t.text "opening_crawl"
    t.string "director"
    t.string "producer"
    t.string "release_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "url"
  end

  create_table "films_planets", force: :cascade do |t|
    t.integer "film_id"
    t.integer "planet_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["film_id"], name: "index_films_planets_on_film_id"
    t.index ["planet_id"], name: "index_films_planets_on_planet_id"
  end

  create_table "films_species", force: :cascade do |t|
    t.integer "film_id"
    t.integer "specie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["film_id"], name: "index_films_species_on_film_id"
    t.index ["specie_id"], name: "index_films_species_on_specie_id"
  end

  create_table "films_starships", force: :cascade do |t|
    t.integer "film_id"
    t.integer "starship_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["film_id"], name: "index_films_starships_on_film_id"
    t.index ["starship_id"], name: "index_films_starships_on_starship_id"
  end

  create_table "films_vehicles", force: :cascade do |t|
    t.integer "film_id"
    t.integer "vehicle_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["film_id"], name: "index_films_vehicles_on_film_id"
    t.index ["vehicle_id"], name: "index_films_vehicles_on_vehicle_id"
  end

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.integer "rotation_period"
    t.integer "orbital_period"
    t.integer "diameter"
    t.string "climate"
    t.string "gravity"
    t.string "terrain"
    t.integer "surface_water"
    t.integer "population"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "url"
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.string "classification"
    t.string "designation"
    t.integer "average_height"
    t.string "skin_colors"
    t.string "hair_colors"
    t.string "eye_colors"
    t.integer "average_lifespan"
    t.string "language"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "starships", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.string "manufacturer"
    t.integer "cost_in_credits"
    t.integer "length"
    t.integer "max_atmosphering_speed"
    t.string "crew"
    t.integer "passengers"
    t.integer "cargo_capacity"
    t.string "consumables"
    t.float "hyperdrive_rating"
    t.integer "MGLT"
    t.string "starship_class"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.string "manufacturer"
    t.integer "cost_in_credits"
    t.float "length"
    t.integer "max_atmosphering_speed"
    t.string "crew"
    t.integer "passengers"
    t.integer "cargo_capacity"
    t.string "consumables"
    t.string "vehicle_class"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "characters", "planets"
  add_foreign_key "chars_films", "characters"
  add_foreign_key "chars_films", "films"
  add_foreign_key "chars_species", "characters"
  add_foreign_key "chars_species", "species"
  add_foreign_key "chars_starships", "characters"
  add_foreign_key "chars_starships", "starships"
  add_foreign_key "chars_vehicles", "characters"
  add_foreign_key "chars_vehicles", "vehicles"
  add_foreign_key "films_planets", "films"
  add_foreign_key "films_planets", "planets"
  add_foreign_key "films_species", "films"
  add_foreign_key "films_species", "species"
  add_foreign_key "films_starships", "films"
  add_foreign_key "films_starships", "starships"
  add_foreign_key "films_vehicles", "films"
  add_foreign_key "films_vehicles", "vehicles"
end
