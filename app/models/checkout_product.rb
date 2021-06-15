# frozen_string_literal: true

class CheckoutProduct < ApplicationRecord
  belongs_to :checkout

  def name
    self[:name][I18n.locale.to_s]
  end
end
