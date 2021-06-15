# frozen_string_literal: true

class CartProduct < ApplicationRecord
  validates :quantity, presence: true, numericality: { integer: true, greather_than: 0 }

  belongs_to :cart
  belongs_to :product
end
