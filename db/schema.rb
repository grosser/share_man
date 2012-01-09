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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120108234357) do

  create_table "companies", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["name"], :name => "index_companies_on_name", :unique => true

  create_table "company_shares", :force => true do |t|
    t.string   "shareholder_name"
    t.integer  "number",           :null => false
    t.date     "purchased_on"
    t.integer  "company_id",       :null => false
    t.integer  "series_id",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "series", :force => true do |t|
    t.string  "name",                                                                          :null => false
    t.decimal "liquidation_amount_per_share", :precision => 7, :scale => 5
    t.integer "liquidation_order",                                                             :null => false
    t.integer "company_id",                                                                    :null => false
    t.boolean "participation",                                              :default => false, :null => false
    t.decimal "participation_cap",            :precision => 7, :scale => 5
  end

  add_index "series", ["company_id", "liquidation_order"], :name => "index_series_on_company_id_and_liquidation_order", :unique => true
  add_index "series", ["company_id", "name"], :name => "index_series_on_company_id_and_name", :unique => true

end
