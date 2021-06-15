# frozen_string_literal: true

module Api
  module V1
    class CheckoutsController < SellerController
      def index
        checkouts = Checkout.where(status: 'payed').includes(%i[checkout_products user]).paginate(
          page: params[:page] || 1, per_page: params[:per_page] || 20
        )

        render jsonapi: checkouts, include: %i[checkout_products user]
      end
    end
  end
end
