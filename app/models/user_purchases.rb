class UserPurchases
  include ActiveModel::Model
  attr_accessor :user_id, :item_name_id, :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchases_id, :item_id, :user_id

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id ,numericality: { other_than: 1, message: "can't be blank"}
    validates :municipality,  format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number,format: { with: /\A\d{10,11}\z/, message: "is out of setting range"}
    # validates :token
    validates :user_id
    validates :item_name_id
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end