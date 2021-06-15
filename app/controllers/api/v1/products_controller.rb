# frozen_string_literal: true

module Api
  module V1
    class ProductsController < BaseController
      def index
        # Falta validar params pagination
        products = Product.includes(:cover)
                          .where('stock > 0')
                          .paginate(page: params[:page] || 1, per_page: params[:per_page] || 20)

        render jsonapi: products, include: [:cover], fields: { image: [:path] }
      end
    end
  end
end
