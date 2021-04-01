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
| comment            | text   | null: false              |

-アソシエーション
 -has many items
 -has many purchases



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
 -belongs to shipping address 
 -belongs to user
 -belongs to purchases

## shipping_address テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| post_code        | string     | null: false       |
| prefecture_id    | integer    | null: false       |
| municipality     | string     | null: false       |
| address          | string     | null: false       |
| building_name    | string     |                   |
| phone_number     | string     | null: false       |
| purchase_history | references | foreign_key: true |

-アソシエーション
 -belongs to purchase

## purchase テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| item_id     | references | foreign_key       |
| user        | references | foreign_key: true |

-アソシエーション
 -belongs to users
 -belongs to items
 -belongs to shipping_address