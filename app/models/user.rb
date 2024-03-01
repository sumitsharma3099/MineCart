class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :cart_items

  # Validations
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: Devise.email_regexp }
  validates :password, presence: true, length: { minimum: Devise.password_length.min }
  validates :password_confirmation, presence: true, if: :password_required?

  # Method to add a product to the user's cart
  def add_to_cart(product)
    existing_item = cart_items.find_by(product: product)

    if existing_item
      qty = existing_item.qty + 1
      total_price = (qty * existing_item.price)
      existing_item.update(qty: qty, total_price: total_price)
    else
      cart_items.create(product: product, price: product.price, total_price: product.price, qty: 1)
    end
  end

  def pending_cart_items
    cart_items.where(order_completed: [false, nil])
  end

  private

  # Check if a password is required for the user
  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end
end
