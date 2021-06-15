# frozen_string_literal: true

class SerializableCartProduct < JSONAPI::Serializable::Resource
  type 'cart_products'

  attributes :quantity

  has_one :product
end
