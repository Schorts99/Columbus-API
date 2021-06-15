# frozen_string_literal: true

class Address < ApplicationRecord
  validates :name, presence: true, length: { in: 1..30 }
  validates :city, presence: true, length: { in: 1..30 }
  validates :address, presence: true, length: { in: 1..100 }
  validates :country, presence: true, length: { in: 1..30 }
  validates :state, presence: true, length: { in: 1..30 }
  validates :postal_code, presence: true, length: { is: 5 }, format: { with: /\A[0-9]+\z/ }
  validates :suburb, length: { in: 1..30 }, allow_blank: true

  belongs_to :user

  def full_address
    "#{address}, #{suburb}, #{postal_code}, #{city}, #{state}, #{country}"
  end
end
