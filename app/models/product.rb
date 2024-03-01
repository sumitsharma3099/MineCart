class Product < ApplicationRecord
    # Associations
    belongs_to :vendor
    has_many :cart_items
  
    # Validations
    validates :name, :description, :price, :qty, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 1 }
    validates :qty, numericality: { greater_than_or_equal_to: 1, only_integer: true }
    validates :image_url, format: { with: URI::DEFAULT_PARSER.make_regexp, message: 'must be a valid URL' }
  
    # You might want to add additional custom validations based on your requirements
  
    # You can add custom methods or scopes based on your application logic
  end
  