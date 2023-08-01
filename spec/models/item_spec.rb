require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができる場合' do
      it '全ての項目が出力されていれば保存できる' do
        expect(@item).to be_valid
      end
   end
    context '商品出品ができない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
        
      end
      it 'nameが空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'contentが空では保存できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'category_idが空では保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが空では保存できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'cost_bearer_idが空では保存できない' do
        @item.cost_bearer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost bearer can't be blank")
      end
      it 'prefecture_idが空では保存できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_day_idが空では保存できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'preiceが300円以下では保存できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price out of setting range")
      end
      it 'priceが9999999円以上では保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price out of setting range")
      end
      it 'priceが全角数字では保存できない' do
      @item.price = '３３３３'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number.")
      end
      it 'userが紐付いていないと出品できない' do
       @item.user = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end