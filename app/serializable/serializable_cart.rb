# frozen_string_literal: true

class SerializableCart < JSONAPI::Serializable::Resource
  type 'carts'

  attributes :total
  attributes :count
  attributes :currency
end
