# frozen_string_literal: true

class SerializableAddress < JSONAPI::Serializable::Resource
  type 'addresses'

  attributes :name
  attributes :address
  attributes :country
  attributes :state
  attributes :postal_code
  attributes :suburb
  attributes :city
end
