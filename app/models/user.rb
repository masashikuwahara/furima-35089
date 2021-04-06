class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
         validates :nickname, presence: true, length: { minimum: 6 }
         validates :password,:password_confirmation, format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
          validates :first_name, :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
          validates :first_name_kana, :family_name_kana, presence: true, format: { with: /\A[ァ-ヶ一ー]+\z/}
          validates :birth
        end
end
