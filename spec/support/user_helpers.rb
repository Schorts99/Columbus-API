# frozen_string_literal: true

require 'faker'
require 'factory_bot_rails'

module UserHelpers
  def create_user
    FactoryBot.create(:user,
                      name: Faker::Name.name,
                      email: Faker::Internet.email,
                      age: rand(18..100),
                      sex: Faker::Gender.binary_type.downcase,
                      password: 'Password1!')
  end

  def build_user
    FactoryBot.build(:user,
                     name: Faker::Name.name,
                     email: Faker::Internet.email,
                     age: rand(18..100),
                     sex: Faker::Gender.binary_type.downcase,
                     password: 'Password1!')
  end
end
