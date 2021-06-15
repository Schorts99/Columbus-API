# frozen_string_literal: true

module Api
  module V1
    module CurrentUser
      class CartController < CustomerController
        def show
          render_jsonapi_response(current_user.cart)
        end
      end
    end
  end
end
