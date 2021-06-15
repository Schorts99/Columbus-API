# frozen_string_literal: true

module Api
  module V1
    class CurrentUserController < ApplicationController
      def show
        render_jsonapi_response(current_user)
      end
    end
  end
end
