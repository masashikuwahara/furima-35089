class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :birth, presence: true
         validates :nickname, presence: true, length: { minimum: 6 }
         validates :password,:password_confirmation,format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
         
         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
          validates :first_name
          validates :family_name
        end
        with_options presence: true, format: { with: /\A[ァ-ヶ一ー]+\z/} do
          validates :first_name_kana
          validates :family_name_kana
        end
end
