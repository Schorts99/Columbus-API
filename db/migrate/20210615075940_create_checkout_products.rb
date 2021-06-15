# frozen_string_literal: true

class CreateCheckoutProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :checkout_products do |t|
      t.references :checkout
      t.integer :quantity
      t.hstore :name
      t.float :price
      t.timestamps
    end
  end
end
