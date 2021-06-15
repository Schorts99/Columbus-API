# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true, length: { in: 1..30 }
  validates :description, presence: true, length: { in: 10..180 }
  validates :stock, presence: true, numericality: {
    only_integer: true,
    greather_or_equal_than: 0
  }

  has_one :cover, class_name: 'Image', as: :resource

  def name
    self[:name][I18n.locale.to_s]
  end

  def description
    self[:description][I18n.locale.to_s]
  end

  def price
    currency = I18n.locale == :es ? 'mxn' : 'usd'
    self[:price][currency]
  end
end
