FactoryBot.define do
  factory :item do
    item_name             {'タイトル'}
    description           {'説明文'}
    category_id           {2}
    status_id             {2}
    shipping_area_id      {2}
    shipping_charge_id    {2}
    days_to_ship_id       {2}
    price                 {1000}

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
