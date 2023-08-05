require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '購入データの保存' do
    before do
      user = FactoryBot.build(:user)
      item = FactoryBot.build(:item)
      @order = FactoryBot.build(:order,user_id: user,item_id: item)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'city_townが空だと保存できないこと' do
        @order.city_town = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City town can't be blank")
      end
      it 'street_numberが空だと保存できないこと' do
        @order.street_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Street number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10文字以下だと保存できないこと' do
        @order.phone_number = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid. 10 to 11 digits of half-width numbers')
      end
      it 'phone_numberが11文字以上だと保存できないこと' do
        @order.phone_number = '123456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid. 10 to 11 digits of half-width numbers')
      end
      it 'phone_numberが全角だと保存できないこと' do
        @order.phone_number = '１２３４５６７８９０１'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid. 10 to 11 digits of half-width numbers')
      end
      it 'tokenが空だと保存できないこと' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
