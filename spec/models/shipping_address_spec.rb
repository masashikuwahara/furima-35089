require 'rails_helper'

RSpec.describe UserPurchases, type: :model do
  before do
    @user_purchases = FactoryBot.build(:user_purchases)
  end

  it '配送先の情報として、郵便番号が必須であること' do
    @user_purchases.post_code = nil
    @user_purchases.valid?
    expect(@user_purchases.errors.full_messages). to include ("Post code can't be blank")
  end
  it '配送先の情報として、都道府県が必須であること' do
    @user_purchases.prefecture_id = 0
    @user_purchases.valid?
    expect(@user_purchases.errors.full_messages). to include ("Address is invalid. Include hyphen(-)")
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
    expect(@user_purchases.errors.full_messages). to include ("Post code is invalid. Include hyphen(-)")
  end
  it '電話番号にはハイフンは不要であること' do
    @user_purchases.phone_number = "000-0000-0000"
    @user_purchases.valid?
    expect(@user_purchases.errors.full_messages). to include ("Phone number is out of setting range")
  end
  it '電話番号は11桁以内であること' do
    @user_purchases.phone_number = "000000000000"
    @user_purchases.valid?
    expect(@user_purchases.errors.full_messages). to include ("Phone number is out of setting range")
  end
end

