# frozen_string_literal: true

class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.float :total, default: 0
      t.string :currency, default: 'mxn'
      t.integer :count, default: 0
      t.timestamps
    end
  end
end
