class ProductsController < ApplicationController
  respond_to :html, :xml, :json
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  # cancan
  load_and_authorize_resource except: [:create]

  def index
    @products = Product.all
    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    @product.save
    respond_with(@product)
  end

  def update
    @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:code, :name, :price, :user_id)
  end
end
