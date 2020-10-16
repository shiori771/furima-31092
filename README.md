# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birth_date      | date    | null: false |


### Association

- has_many :posts
- has_many :items



## posts テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_item_name      | string     | null: false                    |
| post_text           | text       | null: false                    |
| post_category       | string     | null: false                    |
| post_status         | string     | null: false                    |
| shipping_cost       | string     | null: false                    |
| shipping_prefecture | string     | null: false                    |
| shipping_date       | integer    | null: false                    |
| price               | integer    | null: false                    |
| sales_commission    | integer    | null: false                    |
| sales_profit        | integer    | null: false                    |
| user_id (FK)        | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :item


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | integer    | null: false                    |
| expiration_month | integer    | null: false                    |
| expiration_year  | integer    | null: false                    |
| approval_code    | integer    | null: false                    |
| user_id (FK)     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post
- has_one :addresses


## addresses テーブル

| Column       | Type        | Options     |
| ------------ | ----------- | ----------- |
| postcode     | integer(8)  | null: false |
| prefecture   | string      | null: false |
| city         | string      | null: false |
| block        | string      | null: false |
| building     | string      |             |
| phone_number | integer(11) | null: false |

### Association

- belongs_to :item

