# app/controllers/stores_controller.rb

class StoresController < ApplicationController
    before_action :authenticate_user!
  
    # Displays a list of all products in the store
    def index
      @products = Product.all
    end
  end
  