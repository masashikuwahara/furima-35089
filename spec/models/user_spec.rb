require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

   context ' 新規登録/ユーザー情報' do
   it "ニックネームが必須であること" do
    @user.nickname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
   end
   it "メールアドレスが必須であること" do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end
  it 'メールアドレスが一意性であること' do
    @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
  end
  it 'メールアドレスは、@を含む必要があること' do
    @user.email = 'sampleemail.com'
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
  end
  it 'パスワードが必須であること' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it 'パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）' do
      @user.password = '0000000'
      @user.password_confirmation = '0000000'
      @user.valid?
      expect(@user).to be_valid
  end
  it 'パスワードが半角数字のみだと登録できない' do
    @user.password = '000000'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end
  it 'パスワードが半角英字のみだと登録できない' do
    @user.password = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end
  it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
    @user.password = '000000'
    @user.password_confirmation = '000000'
    expect(@user).to be_valid
  end
end
end