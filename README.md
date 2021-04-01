## users テーブル

| Column             | Type   | Options     |
| -----------------  | ------ | ----------- |
| email              | string | unique:true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth              | data   | null: false |
| comment            | text   | null: false |

-アソシエーション
 -has many items
 -has many purchase



## items テーブル

| Column              | Type          | Options     |
| ------------------- | ------------  | ----------- |
| item_name           | string        | null: false |
| category            | text          | null: false |
| price               | integer       | null: false |
| status              | text          | null: false |
| description         | text          | null: false |
| shipping_charge_id  | integer       | null: false |
| shipping_area_id    | integer       | null: false |
| days_to_ship_id     | integer       | null: false |
| user                | references    | foreign_key |

-アソシエーション
 -belongs to shipping address 

## shipping_address テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| post_code     | string     | null: false |
| pretecture    | string     | null: false |
| municipality  | string     | null: false |
| address       | string     | null: false |
| building_name | string     | null: false |
| phone_number  | string     | null: false |
| user          | references | foreign_key |

-アソシエーション
 -belongs to purchase

## purchase テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| item_name   | references | foreign_key |
| user        | references |             |

-アソシエーション
 -belongs to users