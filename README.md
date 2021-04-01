## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| nickname   | string | null: false |
| name       | string | null: false |
| name_kana  | string | null: false |
| birth      | string | null: false |

## items テーブル

| Column            | Type          | Options     |
| ----------------  | ------------  | ----------- |
| item_name         | string        | null: false |
| category          | text          | null: false |
| price             | text          | null: false |
| status            | text          | null: false |
| shipping_charges  | text          | null: false |
| shipping_area     | text          | null: false |
| days_to_ship      | text          | null: false |
| image             | ActiveStorage |             |
| user              | references    |             |

## shipping_address テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| item_name     | text       | null: false |
| post_code     | text       | null: false |
| pretecture    | text       | null: false |
| municipality  | text       | null: false |
| address       | text       | null: false |
| building_name | text       | null: false |
| phone_number  | text       | null: false |
| user          | references |             |

## purchase テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| item_name   | text       | null: false |
| user        | references |             |