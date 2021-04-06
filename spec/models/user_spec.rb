require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    context 'ユーザー登録できる時' do
    it '全ての値が正常に入力されていれば登録できる' do
      expect(@user).to be_valid
    end
    it 'パスワードは６文字以上の半角英数字混合で登録できる' do
    @user.password = '0000aaa'
    @user.password_confirmation = '0000aaa'
    expect(@user).to be_valid
    end
    it 'パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）' do
      @user.password = '0000aaa'
      @user.password_confirmation = '0000aaa'
      @user.valid?
      expect(@user).to be_valid
  end
  end

   context 'ユーザー情報できない時' do
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
  it 'パスワードは全角では登録できないこと' do
    @user.password = '００００ａａａ'
    @user.password_confirmation = '００００ａａａ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end
  it 'パスワードは、５文字以下では登録できない' do
      @user.password = '00aa'
      @user.password_confirmation = '00aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end
  it 'パスワードが半角数字のみだと登録できない' do
    @user.password = '000000'
    @user.password_confirmation = '000000'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end
  it 'パスワードが半角英字のみだと登録できない' do
    @user.password = 'aaaaaa'
    @user.password_confirmation = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end
  it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
    @user.password = '000aaa'
    @user.password_confirmation = 'aaa000'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
end

context ' 新規登録/本人情報確認' do
  it 'ユーザー本名は、名字が必須であること' do
    @user.family_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name can't be blank")
  end
  it 'ユーザー本名は、名前が必須であること' do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end
  it 'ユーザー本名は、名字が全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
    @user.family_name = 'ｸﾜﾊﾗ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name is invalid")
  end
  it 'ユーザー本名は、名前が全角（漢字・ひらがな・カタカナ）での入力が必須であること' do

    @user.first_name = 'ﾏｻｼ'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name is invalid")
  end
  it 'ユーザー本名のフリガナは、名字が必須であること' do
    @user.family_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name kana can't be blank")
  end
  it 'ユーザー本名のフリガナは、名前が必須であること' do
    @user.first_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
  end
  it 'ユーザー名字のフリガナは、全角（カタカナ）での入力が必須であること' do
    @user.family_name_kana = 'ｸﾜﾊﾗ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name kana is invalid")
  end
  it 'ユーザー名字のフリガナは、カタカナ以外の全角文字だと登録できないこと' do
    @user.family_name_kana = '桑原'
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name kana is invalid")
  end
  it 'ユーザー名前のフリガナは、カタカナ以外の全角文字だと登録できないこと' do
    @user.first_name_kana = '雅史'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana is invalid")
  end
  it 'ユーザー名前のフリガナは、全角（カタカナ）での入力が必須であること' do
    @user.first_name = 'ﾏｻｼ'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name is invalid")
  end
  it '生年月日が必須であること' do
    @user.birth = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth can't be blank")
  end
  end
end
end