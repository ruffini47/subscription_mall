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

ActiveRecord::Schema.define(version: 20201218105852) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "kana"
    t.string "line_id"
    t.string "address"
    t.string "phone_number"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "blogs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "body"
    t.string "image_photo"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_blogs_on_admin_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "user_id"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "genre"
    t.string "image_category"
    t.string "search"
    t.index ["owner_id"], name: "index_categories_on_owner_id"
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "subject"
    t.string "message"
    t.bigint "user_id"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_contacts_on_owner_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "cupons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "product"
    t.string "discount"
    t.integer "status"
    t.string "image"
    t.string "writing"
    t.integer "limit"
    t.text "reason"
    t.bigint "review_id"
    t.bigint "owner_id"
    t.bigint "user_id"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_cupons_on_admin_id"
    t.index ["owner_id"], name: "index_cupons_on_owner_id"
    t.index ["review_id"], name: "index_cupons_on_review_id"
    t.index ["user_id"], name: "index_cupons_on_user_id"
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "image_subscription_id"
    t.string "image_interview_id"
    t.text "comment"
    t.datetime "time"
    t.bigint "user_id"
    t.bigint "owner_id"
    t.bigint "subscription_id"
    t.bigint "interview_id"
    t.bigint "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_images_on_blog_id"
    t.index ["interview_id"], name: "index_images_on_interview_id"
    t.index ["owner_id"], name: "index_images_on_owner_id"
    t.index ["subscription_id"], name: "index_images_on_subscription_id"
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "interviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "owner_name"
    t.string "shop_name"
    t.string "content"
    t.string "image_interview"
    t.string "youtube_url"
    t.string "music"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_interviews_on_owner_id"
  end

  create_table "maps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "address"
    t.float "latitude", limit: 24
    t.float "longitude", limit: 24
    t.integer "distance"
    t.integer "near_distance"
    t.integer "time"
    t.integer "near_time"
    t.text "title"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "owner_id"
    t.index ["owner_id"], name: "index_maps_on_owner_id"
  end

  create_table "owners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "phone_number"
    t.string "store_information"
    t.string "payee"
    t.string "line_id"
    t.string "address"
    t.datetime "deleted_at"
    t.text "message"
    t.string "subject"
    t.string "kana"
    t.index ["email"], name: "index_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "content"
    t.integer "price"
    t.text "subscription_detail"
    t.bigint "subscription_id"
    t.bigint "owner_id"
    t.bigint "user_id"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_products_on_admin_id"
    t.index ["owner_id"], name: "index_products_on_owner_id"
    t.index ["subscription_id"], name: "index_products_on_subscription_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "detail"
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "content"
    t.integer "score"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "rate", limit: 24
    t.string "image_id"
    t.string "email"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "shops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "category_name"
    t.integer "monthly_fee"
    t.string "phone_number"
    t.string "store_information"
    t.string "payee"
    t.string "line_id"
    t.string "address"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_shops_on_owner_id"
  end

  create_table "subscriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "title"
    t.text "detail"
    t.string "image_subscription"
    t.integer "price"
    t.text "subscription_detail"
    t.integer "category_name"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shop_id"
    t.string "script"
    t.string "image_subscription2"
    t.string "image_subscription3"
    t.string "image_subscription4"
    t.integer "category_genre"
    t.integer "monthly_fee"
    t.text "blog"
    t.text "shop_introduction"
    t.index ["owner_id"], name: "index_subscriptions_on_owner_id"
  end

  create_table "suports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "subject"
    t.string "message"
    t.bigint "user_id"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_suports_on_owner_id"
    t.index ["user_id"], name: "index_suports_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "kana"
    t.string "line_id"
    t.string "address"
    t.string "phone_number"
    t.string "uid"
    t.string "provider"
    t.datetime "deleted_at"
    t.text "message"
    t.string "subject"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "blogs", "admins"
  add_foreign_key "categories", "owners"
  add_foreign_key "categories", "users"
  add_foreign_key "contacts", "owners"
  add_foreign_key "contacts", "users"
  add_foreign_key "cupons", "admins"
  add_foreign_key "cupons", "owners"
  add_foreign_key "cupons", "reviews"
  add_foreign_key "cupons", "users"
  add_foreign_key "images", "blogs"
  add_foreign_key "images", "interviews"
  add_foreign_key "images", "owners"
  add_foreign_key "images", "subscriptions"
  add_foreign_key "images", "users"
  add_foreign_key "interviews", "owners"
  add_foreign_key "maps", "owners"
  add_foreign_key "products", "admins"
  add_foreign_key "products", "owners"
  add_foreign_key "products", "subscriptions"
  add_foreign_key "products", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "shops", "owners"
  add_foreign_key "subscriptions", "owners"
  add_foreign_key "suports", "owners"
  add_foreign_key "suports", "users"
end
