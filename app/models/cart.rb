# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products

  def update_total_and_count
    total = 0
    count = 0
    currency = I18n.locale == :es ? 'mxn' : 'usd'

    cart_products.each do |product|
      count += product.quantity
      total += product.quantity * product.product.price
    end

    update(total: total, count: count, currency: currency)
  end

  def enough_stock?
    cart_products.includes(:product).each do |cart_product|
      return false if cart_product.quantity > cart_product.product.stock
    end
  end

  def update_products_stock
    cart_products.includes(:product).each do |cart_product|
      cart_product.product.update(stock: cart_product.product.stock - cart_product.quantity)
    end
  end

  def update_products_stock!
    cart_products.includes(:product).each do |cart_product|
      cart_product.product.update!(stock: cart_product.product.stock - cart_product.quantity)
    end
  end

  def empty_cart!
    cart_products.destroy_all
    update(count: 0, total: 0)
  end
end
