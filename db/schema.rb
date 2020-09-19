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

ActiveRecord::Schema.define(version: 2020_09_19_181353) do

  create_table "games", force: :cascade do |t|
    t.integer "score"
    t.integer "cardsleft"
    t.string "card1"
    t.string "card2"
    t.string "card3"
    t.string "card4"
    t.string "card5"
    t.string "card6"
    t.string "card7"
    t.string "card8"
    t.string "card9"
    t.string "card10"
    t.string "card11"
    t.string "card12"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
