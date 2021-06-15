# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')

    create_table :products do |t|
      t.hstore :name
      t.hstore :description
      t.json :price, default: {}
      t.integer :stock

      t.timestamps
    end
  end
end
