# frozen_string_literal: true

module Api
  module V1
    class CustomerController < BaseController
      before_action :authorize_customer!

      def authorize_customer!
        return if current_user.role.name == 'customer'

        current_user.errors.add(:role, :unauthorized)
        render jsonapi_errors: current_user.errors, status: 400
      end
    end
  end
end
