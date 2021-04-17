require 'rails_helper'

RSpec.describe UserPurchases, type: :model do

  before do

    @item = FactoryBot.build(:item)
    @user = FactoryBot.build(:user)
    @user_purchases = FactoryBot.build(:user_purchases,item_id:@item,user_id:@user)
  end

 describe '商品購入' do
  context '商品が購入できる時' do
  it '全ての値が正常に入力されていれば購入できる' do
      expect(@user_purchases).to be_valid
    end
    it '建物名がなくても購入できる' do
      @user_purchases.building_name = nil
      expect(@user_purchases).to be_valid
    end
  end
  context '商品が購入できない時' do
  it '配送先の情報として、郵便番号が必須であること' do
    @user_purchases.post_code = nil
    @user_purchases.valid?
    expect(@user_purchases.errors.full_messages). to include ("Post code can't be blank")
  end
  it '配送先の情報として、都道府県が必須であること' do
    @user_purchases.prefecture_id = nil
    @user_purchases.valid?
    expect(@user_purchases.errors.full_messages). to include ("Prefecture can't be blank")
  end
  it '配送先の情報として、市区町村が必須であること' do
    @user_purchases.municipality = nil
    @user_purchases.valid?
    expect(@user_purchases.errors.full_messages). to include ("Municipality can't be blank")
  end
  it '配送先の情報として、番地が必須であること' do
    @user_purchases.address = nil
    @user_purchases.valid?
    expect(@user_purchases.errors.full_messages). to include ("Address can't be blank")
  end
  it '配送先の情報として、電話番号が必須であること' do
    @user_purchases.phone_number = nil
    @user_purchases.valid?
    expect(@user_purchases.errors.full_messages). to include ( "Phone number can't be blank")
  end
  it '配送先の情報として、郵便番号にはハイフンが必須であること' do
    @user_purchases.post_code = "0000000"
    @user_purchases.valid?
    expect(@user_purchases.errors.full_messages). to include ("Post code is invalid")
  end
  it '電話番号にはハイフンは不要であること' do
    @user_purchases.phone_number = "000-0000-0000"
    @user_purchases.valid?
    expect(@user_purchases.errors.full_messages). to include ("Phone number is invalid")
  end
  it '電話番号は11桁以内であること' do
    @user_purchases.phone_number = "000000000000"
    @user_purchases.valid?
    expect(@user_purchases.errors.full_messages). to include ("Phone number is invalid")
  end
  it 'tokenが空では登録できない' do
    @user_purchases.token = nil
    @user_purchases.valid?
    expect(@user_purchases.errors.full_messages).to include("Token can't be blank")
  end
  it 'user_idが空では登録できない' do
    @user_purchases.user_id = nil
    @user_purchases.valid?
    expect(@user_purchases.errors.full_messages).to include("User can't be blank")
  end
  it 'item_idが空では登録できない' do
    @user_purchases.item_id = nil
    @user_purchases.valid?
    expect(@user_purchases.errors.full_messages).to include("Item can't be blank")
  end
  it '電話番号が英数混合では登録できないこと' do
    @user_purchases.phone_number = "000000aaaaa"
    @user_purchases.valid?
    expect(@user_purchases.errors.full_messages).to include("Phone number is invalid")
  end
  it '都道府県が"--"が選択されている場合は登録できないこと' do
    @user_purchases.prefecture_id = 1
    @user_purchases.valid?
    expect(@user_purchases.errors.full_messages).to include("Prefecture must be other than 1")
  end
  it 'prefecture_idが１以外でないと購入できない' do
    @user_purchases.prefecture_id = 1
    @user_purchases.valid?
    expect(@user_purchases.errors.full_messages).to include("Prefecture must be other than 1")
  end
end
end
end
