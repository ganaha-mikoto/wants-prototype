# Wants

## アプリケーション概要
"Wants"は、ユーザーが希望する商品をリクエストし、それに応じて出品者が商品を出品できるウェブアプリケーションです。リクエストには詳細や希望条件を含めることができ、他のユーザーと情報を共有可能です。

## URL
http://35.73.93.86:3000/

## テスト用アカウント
### 依頼者用
- メールアドレス: test@test
- パスワード: test1111

### 提案者用
- メールアドレス: test2@test
- パスワード: test2222

## 利用方法
### リクエストの投稿
1. トップページのヘッダーから新規登録を行う
2. 「依頼する」ボタンから、リクエスト内容（タイトル、説明、カテゴリー、予算範囲など）を入力
3. 投稿ボタンでリクエストを公開

### 商品の提案
1. リクエスト一覧から興味のあるリクエストを選択
2. 「商品を提案」ボタンから、商品情報（タイトル、説明、価格など）を入力
3. 投稿ボタンで商品を提案

## アプリケーションの特徴
- ユーザーのニーズに基づいた商品提案
- 予算範囲での商品マッチング
- カテゴリー別の閲覧
- 取引の安全性確保
- クレジットカード決済対応

## 実装予定の機能
- [ ] チャット機能
- [ ] 検索機能の強化
- [ ] 評価システムの実装
- [ ] 通知機能の追加

## データベース設計
## データベース設計
ER図：https://github.com/ganaha-mikoto/wants-prototype/blob/3cf30930050d4b892f03c10f42f37d4b014942ae/README.md
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


## 開発環境
- Ruby 2.6.5
- Ruby on Rails 6.0.0
- MySQL 5.6.51
- JavaScript
- AWS (EC2,S3)
- Git/GitHub

## ローカルでの動作方法
% git clone https://github.com/ganaha-mikoto/wants-prototype/wants.git
% cd wants-prototype
% bundle install
% yarn install
% rails db:create
% rails db:migrate
% rails s


