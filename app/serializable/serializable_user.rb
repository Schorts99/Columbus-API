# frozen_string_literal: true

class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :email
  attributes :name
  attributes :age
  attributes :sex
  attributes :role
end
