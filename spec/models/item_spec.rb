require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる時' do
      it '内容が正しければ登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない時' do
    it '商品画像が空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空だと登録できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it '商品の説明が空だと登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーが--だと登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end
    it '商品の状態が--だと登録できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status Select")
    end
    it '配送料の負担が--だと登録できない' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge Select")
    end
    it '発送源の地域が--だと登録できない' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area Select")
    end
    it '発送までの日数が--だと登録できない' do
      @item.days_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship Select")
    end
    it '価格が空だと登録できない' do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が¥300以上でないと登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end
    it '価格が¥9,999,999以下でないと登録できない' do
      @item.price = 10,000,000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end
    it '価格が半角数字でないと登録できない' do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
end
