# frozen_string_literal: true

class SerializableCheckoutProduct < JSONAPI::Serializable::Resource
  type 'checkout_products'

  attribute :quantity
  attribute :name
  attribute :price
end
