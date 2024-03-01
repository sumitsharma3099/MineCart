# app/controllers/admin/products_controller.rb

class Admin::ProductsController < ApplicationController
  # Set the layout for the admin products controller
  layout 'admin'
  
  # Ensure that only authenticated admins can access these actions
  before_action :authenticate_admin!

  # Display a paginated list of all products
  def index
    @products = Product.all.paginate(page: params[:page], per_page: 10)
  end

  # Initialize a new product for the 'new' action
  def new
    @product = Product.new
  end

  # Create a new product based on the submitted form data
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # Retrieve and display the form to edit a specific product
  def edit
    @product = Product.find(params[:id])
  end

  # Update a specific product based on the submitted form data
  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # Delete a specific product
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to admin_products_path, notice: 'Product was successfully destroyed.'
  end

  private

  # Define the permissible parameters for the product
  def product_params
    params.require(:product).permit(:name, :description, :price, :vendor_id, :qty, :image_url)
  end
end
