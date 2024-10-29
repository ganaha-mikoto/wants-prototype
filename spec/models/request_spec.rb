require 'rails_helper'

RSpec.describe Request, type: :model do
  before do
    @request = FactoryBot.build(:request)
  end

  context '商品の新規登録ができる場合' do
    it '全ての情報が正しく入力されていれば登録できる' do
      expect(@request).to be_valid
    end
  end

  context '商品の新規登録ができない場合' do
    it 'ユーザー情報がない場合は登録できない' do
      @request.user = nil
      @request.valid?
      expect(@request.errors.full_messages).to include("User must exist")
    end

    it '商品名が空では登録できない' do
      @request.title= ''
      @request.valid?
      expect(@request.errors.full_messages).to include("Title can't be blank")
    end

    it '説明が空では登録できない' do
      @request.description = ''
      @request.valid?
      expect(@request.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーが選択されていないと登録できない' do
      @request.category_id = 1
      @request.valid?
      expect(@request.errors.full_messages).to include("Category can't be blank")
    end


    it '配送料の負担が選択されていないと登録できない' do
      @request.shipping_charge_id = 1
      @request.valid?
      expect(@request.errors.full_messages).to include("Shipping charge can't be blank")
    end


    it '上限価格が空では登録できない' do
      @request.max_price = ''
      @request.valid?
      expect(@request.errors.full_messages).to include("Max price must be between 300 and 9999999")
    end


    it '下限価格が空では登録できない' do
      @request.min_price = ''
      @request.valid?
      expect(@request.errors.full_messages).to include("Min price must be between 300 and 9999999")
    end

    it '価格が数値でなければ登録できない' do
      @request.min_price = 'abc'
      @request.valid?
      expect(@request.errors.full_messages).to include("Min price must be between 300 and 9999999")
    end

    it '価格が300以下では登録できない' do
      @request.min_price = 200
      @request.valid?
      expect(@request.errors.full_messages).to include("Min price must be between 300 and 9999999")
    end

    it '価格が1,000,000以上では登録できない' do
      @request.min_price = 10000000
      @request.valid?
      expect(@request.errors.full_messages).to include("Min price must be between 300 and 9999999")
    end

  end
end
