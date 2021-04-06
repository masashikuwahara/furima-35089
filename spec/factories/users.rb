FactoryBot.define do
  factory :user do
    nickname              {'nickname'}
    email                 {Faker::Internet.free_email}
    password              {'000aaa'}
    password_confirmation {password}
    family_name           {'桑原'}
    first_name            {'雅史'}
    family_name_kana      {'クワハラ'}
    first_name_kana       {'マサシ'}
    birth                 {'1982-05-07'}
  end
end