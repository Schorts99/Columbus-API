# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.string :country
      t.string :state
      t.string :postal_code
      t.string :suburb
      t.string :city

      t.timestamps
    end
  end
end
