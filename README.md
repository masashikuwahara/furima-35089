## users テーブル

| Column             | Type   | Options                  |
| -----------------  | -----  | -----------------------  |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| family_name        | string | null: false              |
| first_name         | string | null: false              |
| family_name_kana   | string | null: false              |
| first_name_kana    | string | null: false              |
| birth              | data   | null: false              |

-アソシエーション
 -has_many :items
 -has_many  :purchases



## items テーブル

| Column              | Type          | Options           |
| ------------------  | ------------  | ----------------  |
| item_name           | string        | null: false       |
| category_id         | integer       | null: false       |
| price               | integer       | null: false       |
| status_id           | integer       | null: false       |
| description         | text          | null: false       |
| shipping_charge_id  | integer       | null: false       |
| shipping_area_id    | integer       | null: false       |
| days_to_ship_id     | integer       | null: false       |
| user                | references    | foreign_key: true |

-アソシエーション
 -belongs_to :user
 -has_one :purchase

## shipping_addresses テーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| post_code         | string     | null: false       |
| prefecture_id     | integer    | null: false       |
| municipality      | string     | null: false       |
| address           | string     | null: false       |
| building_name     | string     |                   |
| phone_number      | string     | null: false       |
| purchase          | references | foreign_key: true |

-アソシエーション
 -belongs_to :purchase

## purchases テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

-アソシエーション
 -has_one :user
 -has_one :item
 -has_one :shipping_address