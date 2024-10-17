class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def new
    @request = Request.new # 新しいリクエストのインスタンスを作成
  end

  def create
    @request = Request.new(request_params) # リクエストの作成
    @request.user = current_user # ログインユーザーをリクエストのユーザーに設定

    if @request.save
      redirect_to root_path, notice: 'リクエストが作成されました。'
    else
      render :new
    end
  end

  private

  def request_params
    params.require(:request).permit(:title, :description, :category_id, :max_price, :min_price, :image, :shipping_charge_id)
  end
end
