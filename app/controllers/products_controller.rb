class ProductsController < ApplicationController
  def index
    @prodeucts = Product.all
  end

  def new
    @request = Request.find(params[:request_id])
    @product = Product.new
  end

  def create
    @request = Request.find(params[:request_id])
    @product = @request.products.build(product_params)
    @product.user = current_user
    
    if @product.save
      redirect_to request_path(@request), notice: '商品が出品されました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(
      :title, 
      :description, 
      :price, 
      :image,
      :condition_id,
      :shipping_area_id,
      :shipping_day_id
    )
  end
end
