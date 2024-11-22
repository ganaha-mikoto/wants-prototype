require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @seller = FactoryBot.create(:user)
    @product = FactoryBot.create(:product, user: @seller)
    @purchase_form = PurchaseForm.new(
      user_id: @user.id,
      product_id: @product.id,
      postal_code: '123-4567',
      prefecture_id: 2,
      city: '東京都渋谷区',
      addresses: '1-1',
      building: '東京ハイツ',
      phone_number: '09012345678',
      token: 'tok_abcdefghijk00000000000000000'
    )
  end

  describe '商品購入機能' do
    context '商品が購入できる場合' do
      it '全ての情報が正しく入力されていれば購入できる' do
        expect(@purchase_form).to be_valid
      end

      it '建物名が空でも購入できる' do
        @purchase_form.building = ''
        expect(@purchase_form).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'ユーザー情報がない場合は購入できない' do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User must exist")
      end

      it '商品情報がない場合は購入できない' do
        @purchase_form.product_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Product must exist")
      end

      it '郵便番号が空では購入できない' do
        @purchase_form.postal_code = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号はハイフンを含む正しい形式でないと購入できない' do
        @purchase_form.postal_code = '1234567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県が選択されていないと購入できない' do
        @purchase_form.prefecture_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では購入できない' do
        @purchase_form.city = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では購入できない' do
        @purchase_form.address = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では購入できない' do
        @purchase_form.phone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end 