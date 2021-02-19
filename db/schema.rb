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

ActiveRecord::Schema.define(version: 2021_02_12_074327) do

  create_table "boat_alerts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.float "q_min_price", default: 0.0
    t.float "q_max_price"
    t.string "q_manufacturer_name"
    t.string "q_model_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_boat_alerts_on_user_id"
  end

  create_table "boat_categories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id", "name"], name: "index_boat_categories_on_site_id_and_name", unique: true
    t.index ["site_id", "position"], name: "index_boat_categories_on_site_id_and_position"
    t.index ["site_id"], name: "index_boat_categories_on_site_id"
  end

  create_table "boat_equipments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "boat_id"
    t.integer "equipment_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_id", "equipment_id"], name: "index_boat_equipments_on_boat_id_and_equipment_id", unique: true
    t.index ["boat_id"], name: "index_boat_equipments_on_boat_id"
    t.index ["equipment_id"], name: "index_boat_equipments_on_equipment_id"
  end

  create_table "boat_images", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "boat_id"
    t.string "file"
    t.string "alt"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "display_order", default: 0
    t.integer "old_id"
    t.string "large_status"
    t.boolean "optimized", default: false, null: false
    t.index ["boat_id"], name: "index_boat_images_on_boat_id"
  end

  create_table "boats", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "old_id"
    t.string "state"
    t.string "sale_status"
    t.string "boat_type"
    t.string "name"
    t.string "ref_id"
    t.integer "year"
    t.boolean "is_live", default: false
    t.boolean "featured"
    t.boolean "new"
    t.boolean "in_stock"
    t.text "comment"
    t.text "defects"
    t.text "description"
    t.text "disclaimer"
    t.text "additional_info"
    t.boolean "poa"
    t.decimal "price", precision: 17, scale: 3, default: "0.0"
    t.float "length"
    t.float "beam"
    t.float "loa", default: 0.0
    t.float "lwl"
    t.float "draught"
    t.float "air_draught"
    t.float "displacement"
    t.float "fresh_water"
    t.string "designer"
    t.integer "passenger"
    t.string "control_type"
    t.string "cockpit_type"
    t.string "keel_type"
    t.string "hull_construction"
    t.string "hull_type"
    t.string "ballast"
    t.string "super_structure_construction"
    t.string "super_structure_colour"
    t.string "deck_construction"
    t.string "deck_colour"
    t.string "hull_colour"
    t.integer "engine_quantity"
    t.integer "engine_manufacturer_id"
    t.integer "engine_power"
    t.integer "engine_hours"
    t.integer "speed"
    t.integer "max_speed"
    t.float "fuel_tankage"
    t.float "fuel_per_hour"
    t.string "engine_location"
    t.string "gear_box"
    t.string "propeller_type"
    t.string "starting_type"
    t.string "range"
    t.string "vat"
    t.integer "tankage"
    t.integer "cylinders"
    t.datetime "sold_at"
    t.integer "fuel_type_id"
    t.integer "drive_type_id"
    t.integer "currency_id"
    t.integer "office_id"
    t.integer "location_id"
    t.integer "marina_id"
    t.integer "manufacturer_id"
    t.integer "model_id"
    t.integer "user_id"
    t.integer "site_id"
    t.integer "boat_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "highlighted_features1"
    t.string "highlighted_features2"
    t.string "highlighted_features3"
    t.string "highlighted_features4"
    t.boolean "stock_price_above"
    t.float "converted_price"
    t.float "converted_boat_price", default: 0.0
    t.string "status", default: ""
    t.integer "marketing_id"
    t.datetime "expire_date_change_status"
    t.boolean "execute_query", default: true
    t.boolean "is_project", default: false
    t.boolean "ready_to_sail"
    t.integer "country_id"
    t.integer "guest_cabins"
    t.integer "guest_berths"
    t.integer "crew_cabins"
    t.integer "crew_berths"
    t.boolean "not_export"
    t.integer "clone_from_id"
    t.string "clone_progress"
    t.string "hin"
    t.index ["boat_category_id"], name: "index_boats_on_boat_category_id"
    t.index ["boat_type"], name: "index_boats_on_boat_type"
    t.index ["country_id"], name: "index_boats_on_country_id"
    t.index ["currency_id"], name: "index_boats_on_currency_id"
    t.index ["drive_type_id"], name: "index_boats_on_drive_type_id"
    t.index ["engine_manufacturer_id"], name: "index_boats_on_engine_manufacturer_id"
    t.index ["fuel_type_id"], name: "index_boats_on_fuel_type_id"
    t.index ["location_id"], name: "index_boats_on_location_id"
    t.index ["manufacturer_id"], name: "index_boats_on_manufacturer_id"
    t.index ["marina_id"], name: "index_boats_on_marina_id"
    t.index ["marketing_id"], name: "index_boats_on_marketing_id"
    t.index ["model_id"], name: "index_boats_on_model_id"
    t.index ["name"], name: "index_boats_on_name"
    t.index ["office_id"], name: "index_boats_on_office_id"
    t.index ["old_id"], name: "index_boats_on_old_id"
    t.index ["sale_status"], name: "index_boats_on_sale_status"
    t.index ["site_id"], name: "index_boats_on_site_id"
    t.index ["state"], name: "index_boats_on_state"
    t.index ["user_id"], name: "index_boats_on_user_id"
  end

  create_table "brokerage_docs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "boat_id"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["boat_id"], name: "index_brokerage_docs_on_boat_id"
  end

  create_table "brokers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "company"
    t.string "email"
    t.text "search_match"
  end

  create_table "configs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_configs_on_name", unique: true
  end

  create_table "countries", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "iso3166"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "site_id"
    t.index ["site_id"], name: "index_countries_on_site_id"
  end

  create_table "currencies", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.float "rate"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_currencies_on_name"
  end

  create_table "default_settings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.text "text_disclaimer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "default_stock_images", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "alt"
  end

  create_table "drive_types", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id", "name"], name: "index_drive_types_on_site_id_and_name", unique: true
    t.index ["site_id"], name: "index_drive_types_on_site_id"
  end

  create_table "email_settings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.text "subject"
    t.text "body"
    t.integer "boat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "recipient_email"
    t.string "recipient_name"
    t.index ["boat_id"], name: "index_email_settings_on_boat_id"
  end

  create_table "engine_manufacturers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id", "name"], name: "index_engine_manufacturers_on_site_id_and_name", unique: true
    t.index ["site_id"], name: "index_engine_manufacturers_on_site_id"
  end

  create_table "equipment", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "equipment_category_id"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "boat_equipments_count", default: 0
    t.index ["equipment_category_id", "name"], name: "index_equipment_on_equipment_category_id_and_name"
    t.index ["equipment_category_id"], name: "index_equipment_on_equipment_category_id"
    t.index ["site_id"], name: "index_equipment_on_site_id"
  end

  create_table "equipment_categories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id", "name"], name: "index_equipment_categories_on_site_id_and_name", unique: true
    t.index ["site_id"], name: "index_equipment_categories_on_site_id"
  end

  create_table "exports", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.string "slug"
    t.string "boat_type", default: "all"
    t.index ["slug"], name: "index_exports_on_slug", unique: true
  end

  create_table "friendly_id_slugs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, length: { slug: 70, scope: 70 }
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", length: { slug: 140 }
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "fuel_types", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id", "name"], name: "index_fuel_types_on_site_id_and_name", unique: true
    t.index ["site_id"], name: "index_fuel_types_on_site_id"
  end

  create_table "lead_process_files", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_name"
    t.integer "boat_id"
    t.decimal "price", precision: 10
    t.string "manufacturer"
    t.string "location"
    t.string "lead_mailbox_directory"
    t.integer "rule_id"
    t.integer "user_id"
    t.string "subject", limit: 191
    t.text "matched_line"
  end

  create_table "lead_rule_users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "rule_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lead_count", default: 0
  end

  create_table "lead_rules", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "keyword", null: false
    t.string "keyword_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority_order", default: 0
    t.string "operator"
    t.decimal "number_keyword", precision: 10
  end

  create_table "locations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id", "name"], name: "index_locations_on_site_id_and_name", unique: true
    t.index ["site_id"], name: "index_locations_on_site_id"
  end

  create_table "manufacturers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id", "name"], name: "index_manufacturers_on_site_id_and_name", unique: true
    t.index ["site_id"], name: "index_manufacturers_on_site_id"
  end

  create_table "marinas", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "location_id"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id", "name"], name: "index_marinas_on_location_id_and_name", unique: true
    t.index ["location_id"], name: "index_marinas_on_location_id"
    t.index ["site_id"], name: "index_marinas_on_site_id"
  end

  create_table "marketings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "status", null: false
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "colour"
    t.index ["site_id", "status"], name: "index_marketings_on_site_id_and_status", unique: true
    t.index ["site_id"], name: "index_marketings_on_site_id"
  end

  create_table "models", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "manufacturer_id"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manufacturer_id", "name"], name: "index_models_on_manufacturer_id_and_name", unique: true
    t.index ["manufacturer_id"], name: "index_models_on_manufacturer_id"
    t.index ["site_id"], name: "index_models_on_site_id"
  end

  create_table "offices", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "reference"
    t.string "name"
    t.string "daytime_phone"
    t.string "eve_phone"
    t.string "fax"
    t.string "mobile"
    t.string "website"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "email"
    t.string "address_second"
    t.string "city"
    t.string "country"
    t.string "open"
    t.string "close"
    t.string "region"
    t.string "postcode"
    t.text "hotel"
    t.string "lat"
    t.string "lng"
    t.index ["site_id"], name: "index_offices_on_site_id"
  end

  create_table "page_views", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "count", default: 0, null: false
    t.string "viewable_type", null: false
    t.integer "viewable_id", null: false
    t.string "token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "visitor_email"
    t.string "visitor_name"
  end

  create_table "quantity_boats", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "link"
    t.string "site_name"
    t.integer "quantity", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "query_customers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.text "query_statement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "customer_email"
    t.string "customer_name"
    t.integer "period_day", default: 0
  end

  create_table "recipient_relations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "boat_id"
    t.integer "export_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_id"], name: "index_recipient_relations_on_boat_id"
    t.index ["export_id"], name: "index_recipient_relations_on_export_id"
  end

  create_table "selling_boats", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "contact_first_name"
    t.string "contact_last_name"
    t.string "contact_email"
    t.string "contact_primary_number"
    t.string "manufacturer"
    t.string "model"
    t.integer "year"
    t.string "engine_manufacturer"
    t.integer "engine_hours"
    t.string "fault"
    t.string "boat_location"
    t.string "selling_option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "progress_steps"
    t.datetime "offer_made_at"
    t.datetime "offer_rejected_at"
    t.datetime "offer_accepted_at"
    t.datetime "sales_contract_sent_at"
    t.datetime "contract_signed_at"
    t.datetime "boat_info_wizard_link_sent_at"
    t.datetime "boat_wizard_completed_at"
    t.datetime "became_live_at"
  end

  create_table "sites", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "domain"
    t.string "telephone"
    t.string "email"
    t.string "address"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "default_disclaimer"
  end

  create_table "upload_forms", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "comment"
    t.integer "boat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "uploaded_files", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "file"
    t.integer "form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "role_id"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "receive_notification", default: false
    t.string "mobile"
    t.boolean "accept_lead", default: false
    t.boolean "on_holiday", default: false
    t.string "lead_mailbox_directory"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["site_id"], name: "index_users_on_site_id"
  end

  create_table "videos", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "boat_id"
    t.string "thumb"
    t.string "url"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_id"], name: "index_videos_on_boat_id"
  end

  create_table "videos_assets_audios", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "title", null: false
    t.boolean "active", default: true, null: false
    t.boolean "default", default: false, null: false
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id"
    t.integer "site_id"
  end

  create_table "videos_videos", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "title", null: false
    t.string "description"
    t.boolean "active", default: true, null: false
    t.boolean "default", default: false, null: false
    t.string "type"
    t.string "youtube_id"
    t.string "file"
    t.integer "intro_id"
    t.integer "outro_id"
    t.integer "audio_id"
    t.string "status", default: "processing"
    t.string "privacy_status", default: "unlisted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id"
    t.integer "owner_id"
    t.string "owner_type"
    t.integer "position", default: 0, null: false
    t.integer "site_id"
  end

  add_foreign_key "boat_alerts", "users"
  add_foreign_key "boat_categories", "sites"
  add_foreign_key "boats", "boat_categories"
  add_foreign_key "boats", "countries"
  add_foreign_key "boats", "currencies"
  add_foreign_key "boats", "drive_types"
  add_foreign_key "boats", "engine_manufacturers"
  add_foreign_key "boats", "fuel_types"
  add_foreign_key "boats", "locations"
  add_foreign_key "boats", "manufacturers"
  add_foreign_key "boats", "marinas"
  add_foreign_key "boats", "marketings"
  add_foreign_key "boats", "models"
  add_foreign_key "boats", "offices"
  add_foreign_key "boats", "sites"
  add_foreign_key "boats", "users"
  add_foreign_key "countries", "sites"
  add_foreign_key "drive_types", "sites"
  add_foreign_key "engine_manufacturers", "sites"
  add_foreign_key "equipment", "equipment_categories"
  add_foreign_key "equipment", "sites"
  add_foreign_key "equipment_categories", "sites"
  add_foreign_key "fuel_types", "sites"
  add_foreign_key "locations", "sites"
  add_foreign_key "manufacturers", "sites"
  add_foreign_key "marinas", "locations"
  add_foreign_key "marinas", "sites"
  add_foreign_key "marketings", "sites"
  add_foreign_key "models", "manufacturers"
  add_foreign_key "models", "sites"
  add_foreign_key "offices", "sites"
  add_foreign_key "users", "sites"
end
