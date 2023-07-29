## users テーブル

| Column                | Type   | Options     |
| ------------------    | ------ | ----------- |
| name                  | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| family_name           | string | null: false |
| first_name            | string | null: false |
| family_name_kana      | string | null: false |
| first_name_kana       | string | null: false |
| birthday              | date   | null: false |

### Association

- has_many :items
- has_many :shippings

## items テーブル

| Column        | Type        | Options     |
| ------        | ------      | ----------- |
| image         | string      | null: false |
| name          | string      | null: false |
| content       | text        | null: false |
| category      | integer     | null: false |
| price         | integer     | null: false |
| cost_bearer   | string      | null: false |
| source_address| string      | null: false |
| shipping_days | integer     | null: false |
| user_id       | references     | null: false  foreign_key: true |
### Association

- belongs_to :user
- has_one    :shipping

## shipping テーブル

| Column          | Type       | Options                        |
| ------          | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| items_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one    :shipping_address

## shipping_address テーブル

| Column            | Type       | Options     |
| -------           | ---------- | ----------- |
| postal_code       | integer    | null: false |
| prefecture        | string     | null: false |
| city_town         | string     | null: false |
| street_number     | string     | null: false |
| building_name     | string     |             | 
| phone_number      | integer    | null:false  |
### Association

- belongs_to :shipping
