# frozen_string_literal: true

class SerializableProduct < JSONAPI::Serializable::Resource
  type 'products'

  attributes :name
  attributes :description
  attributes :price
  attributes :stock

  has_one :cover
end
