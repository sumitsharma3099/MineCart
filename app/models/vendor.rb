# app/models/vendor.rb

class Vendor < ApplicationRecord
    # A vendor has many products associated with it
    has_many :products
  end
  