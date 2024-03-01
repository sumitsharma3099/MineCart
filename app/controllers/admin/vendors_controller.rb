# app/controllers/admin/vendors_controller.rb

class Admin::VendorsController < ApplicationController
  # Set the layout for the admin vendors controller
  layout 'admin'

  # Ensure that only authenticated admins can access these actions
  before_action :authenticate_admin!

  # Display a list of all vendors
  def index
    @vendors = Vendor.all
  end
end
