# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_615_075_940) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'hstore'
  enable_extension 'plpgsql'

  create_table 'addresses', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.string 'name'
    t.string 'address'
    t.string 'country'
    t.string 'state'
    t.string 'postal_code'
    t.string 'suburb'
    t.string 'city'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_addresses_on_user_id'
  end

  create_table 'cart_products', force: :cascade do |t|
    t.bigint 'cart_id', null: false
    t.bigint 'product_id', null: false
    t.integer 'quantity', default: 0
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['cart_id'], name: 'index_cart_products_on_cart_id'
    t.index ['product_id'], name: 'index_cart_products_on_product_id'
  end

  create_table 'carts', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.float 'total', default: 0.0
    t.string 'currency', default: 'mxn'
    t.integer 'count', default: 0
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_carts_on_user_id'
  end

  create_table 'checkout_products', force: :cascade do |t|
    t.bigint 'checkout_id'
    t.integer 'quantity'
    t.hstore 'name'
    t.float 'price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['checkout_id'], name: 'index_checkout_products_on_checkout_id'
  end

  create_table 'checkouts', force: :cascade do |t|
    t.bigint 'user_id'
    t.string 'currency'
    t.float 'total'
    t.string 'shipment_address'
    t.string 'status'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_checkouts_on_user_id'
  end

  create_table 'images', force: :cascade do |t|
    t.string 'resource_type', null: false
    t.bigint 'resource_id', null: false
    t.string 'filename'
    t.string 'path'
    t.string 'content_type'
    t.hstore 'variants', default: {}
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[resource_type resource_id], name: 'index_images_on_resource'
  end

  create_table 'jwt_denylists', force: :cascade do |t|
    t.string 'jti', null: false
    t.datetime 'expired_at', null: false
    t.index ['jti'], name: 'index_jwt_denylists_on_jti'
  end

  create_table 'products', force: :cascade do |t|
    t.hstore 'name'
    t.hstore 'description'
    t.json 'price', default: {}
    t.integer 'stock'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'name'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[name resource_type resource_id], name: 'index_roles_on_name_and_resource_type_and_resource_id'
    t.index %w[resource_type resource_id], name: 'index_roles_on_resource'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'name'
    t.integer 'age'
    t.string 'sex'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'users_roles', id: false, force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'role_id'
    t.index ['role_id'], name: 'index_users_roles_on_role_id'
    t.index %w[user_id role_id], name: 'index_users_roles_on_user_id_and_role_id'
    t.index ['user_id'], name: 'index_users_roles_on_user_id'
  end

  add_foreign_key 'addresses', 'users'
  add_foreign_key 'cart_products', 'carts'
  add_foreign_key 'cart_products', 'products'
  add_foreign_key 'carts', 'users'
end
