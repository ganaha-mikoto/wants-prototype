class ProductsController < ApplicationController
  def index
    @prodeucts = Product.all
  end

  def new
    @prodeucts = Product.new
  end

  def create
    @product = Product.new(product_params) # リクエストの作成
    @product.user = current_user # ログインユーザーをリクエストのユーザーに設定

    if @product.save
      redirect_to root_path, notice: '出品が完了しました。'
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
end
