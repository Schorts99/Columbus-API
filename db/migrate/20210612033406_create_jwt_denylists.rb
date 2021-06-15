# frozen_string_literal: true

class CreateJwtDenylists < ActiveRecord::Migration[6.1]
  def change
    create_table :jwt_denylists do |t|
      t.string :jti, null: false, index: true
      t.datetime :expired_at, null: false
    end
  end
end
