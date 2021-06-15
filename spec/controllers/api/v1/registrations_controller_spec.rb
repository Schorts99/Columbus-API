# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::RegistrationsController, type: :request do
  let(:user) { build_user }
  let(:existing_user) { create_user }

  context 'When signing up' do
    before do
      post user_registration_path, params: {
        user: {
          name: user.name,
          age: user.age,
          sex: user.sex,
          email: user.email,
          password: user.password
        }
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'returns a token' do
      expect(response.headers['Authorization']).to be_present
    end
  end

  context 'When email has been already taken' do
    before do
      post user_registration_path, params: {
        user: {
          name: existing_user.name,
          age: existing_user.age,
          sex: existing_user.sex,
          email: existing_user.email,
          password: existing_user.password
        }
      }
    end

    it 'returns 400' do
      expect(response.status).to eq(400)
    end
  end
end
