FactoryBot.define do
  factory :item do
    item_name             {'タイトル'}
    description           {'説明文'}
    category_id           {2}
    status_id             {2}
    shipping_area_id      {2}
    shipping_charge_id    {2}
    days_to_ship          {2}
    price                 {1000}
  end
end
