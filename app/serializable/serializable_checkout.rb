# frozen_string_literal: true

class SerializableCheckout < JSONAPI::Serializable::Resource
  type 'checkouts'

  attribute :currency
  attribute :total
  attribute :shipment_address

  has_many :checkout_products
  belongs_to :user
end
