class Admin::ProductsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required
  layout 'admin/application'

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:title, :format, :description, :quantity, :price, :other)
  end
  def admin_required
    if !current_user.admin?
      redirect_to "/"
    end
  end
end
