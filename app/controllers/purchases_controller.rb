require 'payjp'

class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_request  
  before_action :set_product, only: [:index, :create]
  before_action :move_to_root, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    @purchase_form.user_id = current_user.id
    @purchase_form.product_id = @product.id
    @purchase_form.request_id = params[:request_id]
    @purchase_form.token = params[:token]

    if @purchase_form.valid?
      pay_product
      @purchase_form.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_form).permit(
      :postal_code, :prefecture_id, :city,
      :addresses, :building, :phone_number
    ).merge(token: params[:token])
  end

  def set_request  
    @request = Request.find(params[:request_id])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_root
    if current_user.id == @product.user_id
      redirect_to root_path
    end
  end
end
