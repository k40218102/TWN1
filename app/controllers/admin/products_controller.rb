class Admin::ProductsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required
  layout 'admin/application'

  def index
    @products = Product.all
    # @photos = @product.photo.all
  end

  def new
    @product = Product.new
    @photo = @product.photo.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      if params[:photos] != nil
        params[:photos]['image'].each do |a|
          @photo = @product.photo.create(:image => a)
        end
      end
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    if @product.photo.present?
      @photo = @product.photo
    else
      @photo = @product.photo.build
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :format, :description, :quantity, :price, :other, photo_attributes: [:image, :id])
  end
  def admin_required
    if !current_user.admin?
      redirect_to "/"
    end
  end
end
