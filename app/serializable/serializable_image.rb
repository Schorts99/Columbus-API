# frozen_string_literal: true

class SerializableImage < JSONAPI::Serializable::Resource
  type 'images'

  attributes :path
end
