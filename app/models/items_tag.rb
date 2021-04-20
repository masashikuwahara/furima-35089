class ItemsTag

  include ActiveModel::Model
  attr_accessor :item_name, :name, :category_id, :price, :status_id, :description, :shipping_charge_id, :shipping_area_id, :days_to_ship_id, :image, :user_id

  with_options presence: true do
    validates :item_name
    validates :name
  end

  def save
    item = Item.create(item_name: item_name, category_id: category_id, price: price, status_id: status_id, description: description, shipping_charge_id: shipping_charge_id, shipping_area_id: shipping_area_id, days_to_ship_id: days_to_ship_id, image: image, user_id: user_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save


    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

end