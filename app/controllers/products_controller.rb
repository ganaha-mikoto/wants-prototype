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
    @request = Request.find(params[:request_id])
    @product = @request.products.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: '商品が見つかりません'
  end

  def edit
    @request = Request.find(params[:request_id])
    @product = Product.find(params[:id])
    
    if @product.user != current_user
      redirect_to root_path, alert: '編集権限がありません'
    end
  end

  def update
    @request = Request.find(params[:request_id])
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to request_product_path(@request, @product), notice: '商品情報が更新されました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @request = Request.find(params[:request_id])
    @product = Product.find(params[:id])

    if @product.user == current_user
      @product.destroy
      redirect_to root_path, notice: 'リクエストが削除されました。'
    else
      redirect_to root_path, alert: 'このリクエストを削除する権限がありません。'
    end
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
