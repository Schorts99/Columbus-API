# frozen_string_literal: true

module Api
  module V1
    module CurrentUser
      class AddressesController < CustomerController
        def index
          render_jsonapi_response(current_user.addresses)
        end

        def create
          address = current_user.addresses.new(address_params)

          unless current_user.can_add_address?
            address.errors.add(:base, :limit_reached)
            return render_jsonapi_response(address)
          end

          return head :created if address.save

          render_jsonapi_response(address)
        end

        private

        def address_params
          params.require(:address).permit(:name, :address, :country, :state, :postal_code, :suburb, :city)
        end
      end
    end
  end
end
