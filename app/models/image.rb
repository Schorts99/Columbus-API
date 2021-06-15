# frozen_string_literal: true

# Was going to implement Cloud storage but run out of time, thats why so many attributes without use
class Image < ApplicationRecord
  belongs_to :resource, polymorphic: true
end
