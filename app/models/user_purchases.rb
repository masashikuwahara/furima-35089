class UserPurchases
  include ActiveModel::Model
  attr_accessor :user_id, :item_name_id, :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchases_id, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id ,numericality: { other_than: 1}
    validates :municipality
    validates :address
    validates :phone_number,format: { with: /\A\d{10,11}\z/}
    validates :token, presence: true
    validates :user_id
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end