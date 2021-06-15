# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.references :resource, null: false, polymorphic: true
      t.string :filename
      t.string :path
      t.string :content_type
      t.hstore :variants, default: {}
      t.timestamps
    end
  end
end
