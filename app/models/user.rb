# frozen_string_literal: true

class User < ApplicationRecord
  after_create :assign_default_role

  rolify before_add: :remove_old_roles, after_add: :create_resources
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  validates :name, presence: true, only_letters: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }
  validates :age, presence: true, numericality: { only_integer: true, greather_than: 18, minor_than: 100 }
  validates :sex, presence: true, inclusion: { in: %w[male female] }

  has_one :cart
  has_many :addresses, dependent: :delete_all
  has_many :checkouts

  def role
    roles.find_by(resource: nil)
  end

  def can_add_address?
    addresses.count < 4
  end

  private

  def assign_default_role
    add_role(:customer) if roles.blank?
  end

  def remove_old_roles(role)
    roles.where(resource: nil).destroy_all
    cart.destroy if role.name == 'seller'
  end

  def create_resources(role)
    create_cart if role.name == 'customer'
  end
end
