# frozen_string_literal: true

module Api
  module V1
    module CurrentUser
      class CheckoutController < CustomerController
        def create
          current_cart = current_user.cart
          checkout = current_user.checkouts.find_by(status: 'pending') || current_user.checkouts.create
          shipment_address = current_user.addresses.find(checkout_params[:address_id])

          unless current_cart.enough_stock?
            checkout.errors.add(:base, :insufficient_stock)
            return render_jsonapi_response(checkout)
          end

          Checkout.transaction do
            checkout.update!(
              shipment_address: shipment_address.full_address,
              currency: current_cart.currency,
              total: current_cart.total
            )
            checkout_products = []
            current_cart.cart_products.each do |cart_product|
              checkout_products << {
                checkout: checkout,
                quantity: cart_product.quantity,
                name: cart_product.product.attributes['name'],
                price: cart_product.product.price
              }
            end
            CheckoutProduct.create!(checkout_products)
            current_cart.update_products_stock!
            checkout.update!(status: 'payed')
            current_cart.empty_cart!
          end

          head :ok
        end

        private

        def checkout_params
          params.require(:checkout).permit(:address_id)
        end
      end
    end
  end
end
