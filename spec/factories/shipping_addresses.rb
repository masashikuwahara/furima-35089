FactoryBot.define do
  factory :user_purchases do
    post_code   { '123-4567' }
    prefecture_id    { 0 }
    municipality  { '東京都' }
    address       { '1-1' }
    building_name { 'カーサエスパシオ' }
    phone_number  { 00000000000 }
  end
end
