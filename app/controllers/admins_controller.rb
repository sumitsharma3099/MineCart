class AdminsController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!
    
    def dashboard
        @total_orders = CartItem.total_order_completed.count
        @total_sales = CartItem.total_order_completed.sum(&:total_price)
        @total_users = User.count
    end
end
