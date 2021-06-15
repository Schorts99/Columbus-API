# frozen_string_literal: true

module Api
  module V1
    module CurrentUser
      module Cart
        class ProductsController < CustomerController
          def index
            render jsonapi: current_user.cart.cart_products.includes(product: [:cover]),
                   include: [product: [:cover]]
          end

          def update
            product = Product.find(product_params[:id])
            increase = product_params[:increase]
            return if product.nil?

            if product.stock < 1 && increase
              product.errors.add(:stock, :insufficient)
              return render_jsonapi_response(product)
            end

            existent_product_cart = current_user.cart.cart_products.find_by(product: product)

            if existent_product_cart
              new_product_quantity = existent_product_cart.quantity + (increase ? 1 : -1)

              if new_product_quantity > product.stock
                product.errors.add(:stock, :insufficient)
                return render_jsonapi_response(product)
              end

              if new_product_quantity.positive?
                existent_product_cart.update(quantity: new_product_quantity)
                current_user.cart.update_total_and_count

                return head :ok
              end

              existent_product_cart.destroy
              current_user.cart.update_total_and_count

              return head :ok
            elsif increase
              current_user.cart.cart_products.create(product: product, quantity: 1)
              current_user.cart.update_total_and_count

              return head :ok
            end

            head 400
          end

          private

          def product_params
            params.require(:product).permit(:id, :increase)
          end
        end
      end
    end
  end
end
