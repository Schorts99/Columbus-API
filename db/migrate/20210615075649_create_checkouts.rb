# frozen_string_literal: true

class CreateCheckouts < ActiveRecord::Migration[6.1]
  def change
    create_table :checkouts do |t|
      t.references :user
      t.string :currency
      t.float :total
      t.string :shipment_address
      t.string :status, default: 'pending'
      t.timestamps
    end
  end
end
