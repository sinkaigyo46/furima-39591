require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '購入データの保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: @user.id, item_id: @item.id)
      sleep(1)
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
        expect(@order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('郵便番号は半角の数字とハイフン(-)で入力して下さい')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'city_townが空だと保存できないこと' do
        @order.city_town = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'street_numberが空だと保存できないこと' do
        @order.street_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが10文字以下だと保存できないこと' do
        @order.phone_number = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('電話番号は10文字から11文字の半角数字で入力してください')
      end
      it 'phone_numberが11文字以上だと保存できないこと' do
        @order.phone_number = '123456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include('電話番号は10文字から11文字の半角数字で入力してください')
      end
      it 'phone_numberが全角だと保存できないこと' do
        @order.phone_number = '１２３４５６７８９０１'
        @order.valid?
        expect(@order.errors.full_messages).to include('電話番号は10文字から11文字の半角数字で入力してください')
      end
      it 'tokenが空だと保存できないこと' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
