class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :price, numericality: {with: /\A[0-9]+\z/}
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  end
  
  validates :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id, numericality: { other_than: 1, message: 'Select' }
end
