## users テーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| name               | string | null: false                    |
| email              | string | null: false, unique: true      |
| password_confirmation| string | null: false                    |
| first_name         | string | null: false                    |
| last_name          | string | null: false                    |
| first_name_kana    | string | null: false                    |
| last_name_kana     | string | null: false                    |
| birthday           | date   | null: false                    |

### Association
- has_many :requests
- has_many :products
- has_many :purchases
- has_one  :histories

## requests テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| description  | text       | null: false                    |
| category_id  | integer    | null: false                    |
| max_price    | integer    | null: false                    |
| min_price    | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| image        | string     |                                |
| shipping_charge_id  | integer    | null: false                    |

### Association
- belongs_to :user
- has_many :products
- has_many :comments

## products テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| description  | text       | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| request      | references | null: false, foreign_key: true |
| image        | string     |                                |
| condition_id        | integer    | null: false                    |
| shipping_area_id    | integer    | null: false                    |
| shipping_day_id     | integer    | null: false                    |

### Association
- belongs_to :user
- belongs_to :request
- has_one :purchase

## shipping_address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| shipping_area_id    | integer    | null: false                    |
| city                | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |
| history             | references | null: false, foreign_key: true |

### Association
- belongs_to ：history

## histories テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| product             | references | null: false, foreign_key: true |
| request             | references | null: false, foreign_key: true |

### Association

  - belongs_to :user
  - belongs_to :product
  - belongs_to :request


## question_response テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| request      | references | null: false, foreign_key: true |

### Association
  - belongs_to :user
  - belongs_to :request
