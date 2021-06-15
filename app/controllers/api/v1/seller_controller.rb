# frozen_string_literal: true

module Api
  module V1
    class SellerController < BaseController
      before_action :authorize_seller!

      def authorize_seller!
        return if current_user.role.name == 'seller'

        current_user.errors.add(:role, :unauthorized)
        render jsonapi_errors: current_user.errors, status: 400
      end
    end
  end
end
