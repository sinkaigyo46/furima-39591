## users テーブル

| Column                | Type   | Options                  |
| ------------------    | ------ | -----------              |
| name                  | string | null: false              |
| email                 | string | null: false, unique:true |
| encrypted_password    | string | null: false              |
| family_name           | string | null: false              |
| first_name            | string | null: false              |
| family_name_kana      | string | null: false              |
| first_name_kana       | string | null: false              |
| birthday              | date   | null: false              | 

### Association

- has_many :items
- has_many :shippings

## items テーブル

| Column           | Type        | Options     |
| ------           | ------      | ----------- |
| name             | string      | null: false |
| content          | text        | null: false |
| category_id      | integer     | null: false |
| status_id        | integer     | null: false |
| cost_bearer_id   | integer     | null: false |
| prefecture_id    | integer     | null: false |
| shipping_day_id  | integer     | null: false |
| price            | integer     | null: false |
| user             | references  | null: false,  foreign_key: true |
### Association

- belongs_to :user
- has_one    :shipping

## shippings テーブル

| Column          | Type       | Options                        |
| ------          | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address

## shipping_addresses テーブル

| Column            | Type       | Options     |
| -------           | ---------- | ----------- |
| postal_code       | string     | null: false |
| prefecture_id     | integer    | null: false |
| city_town         | string     | null: false |
| street_number     | string     | null: false |
| building_name     | string     |             | 
| phone_number      | string     | null: false |
### Association

- belongs_to :shipping
