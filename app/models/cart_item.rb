class CartItem < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :product

  # Scope to retrieve cart items with order_completed set to true
  scope :total_order_completed, -> { where(order_completed: true) }

  # Validations
  validates :user, :product, presence: true
  validates :price, :total_price, :qty, numericality: { greater_than_or_equal_to: 1 }
end
