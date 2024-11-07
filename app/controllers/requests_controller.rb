class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  
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
      render :new, status: :unprocessable_entity
    end
  end




  def show
    @request = Request.find(params[:id])
    @products = @request.products  # 追加：リクエストに関連する商品を取得
  end


  def edit
    if @request.user != current_user #|| @request.history.present?
      redirect_to root_path
    end
  end

  def update
    if @request.update(request_params)
      redirect_to @request
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @request.user == current_user
      @request.destroy
      redirect_to root_path, notice: 'リクエストが削除されました。'
    else
      redirect_to root_path, alert: 'このリクエストを削除する権限がありません。'
    end
  end


  private

  def request_params
    params.require(:request).permit(:title, :description, :category_id, :max_price, :min_price, :image, :shipping_charge_id)
  end

  def set_request
    @request = Request.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'リクエストが見つかりません。'
  end
end
