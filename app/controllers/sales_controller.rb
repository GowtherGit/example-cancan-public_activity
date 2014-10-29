class SalesController < ApplicationController
  respond_to :html, :xml, :json
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  # cancan
  load_and_authorize_resource except: [:create]

  def index
    @sales = Sale.all
    respond_with(@sales)
  end

  def show
    respond_with(@sale)
  end

  def new
    @sale = Sale.new
    respond_with(@sale)
  end

  def edit
  end

  def create
    @sale = Sale.new(sale_params)
    @sale.user_id = current_user.id
    @sale.total = @sale.total_all
    @sale.save
    respond_with(@sale)
  end

  def update
    @sale.update(sale_params)
    respond_with(@sale)
  end

  def destroy
    @sale.destroy
    respond_with(@sale)
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:name,
                                 :total,
                                 :user_id,
                                 items_attributes: [
                                  :id,
                                  :product_id,
                                  :price,
                                  :quantity,
                                  :total,
                                  :_destroy
                                  ])
  end
end
