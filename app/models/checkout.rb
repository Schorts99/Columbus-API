# frozen_string_literal: true

class Checkout < ApplicationRecord
  has_many :checkout_products
  belongs_to :user
end
