# Wants

## アプリケーション概要
"Wants"は、ユーザーが希望する商品をリクエストし、それに応じて出品者が商品を出品できるウェブアプリケーションです。リクエストには詳細や希望条件を含めることができ、他のユーザーと情報を共有可能です。

## URL
http://35.73.93.86/

## テスト用アカウント
### 依頼者用
- メールアドレス: test@test
- パスワード: test1111

### 提案者用
- メールアドレス: test2@test
- パスワード: test2222

## クレジットカード
### カード番号：4242424242424242
### 有効期限：操作日より未来の日にち
### CVC: 123
### カード名義： PAY TARO

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
- レスポンシブデザインによるスマートフォン対応
  - メディアクエリを使用した画面サイズに応じたレイアウト調整
  - タッチ操作に最適化されたUIデザイン
  - スマートフォンでの閲覧性を考慮したフォントサイズと余白の調整

## 実装予定の機能
- [ ] チャット機能
- [ ] カテゴリー・ブランド分類
- [ ] マイページ機能
- [ ] ガイドラインや利用規約
- [ ] 検索機能
- [ ] 評価システムの実装
- [ ] 通知機能の追加

## データベース設計
ER図：https://github.com/ganaha-mikoto/wants-prototype/blob/main/wants.dio

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
- Ruby 3.2.6
- Ruby on Rails 7.0.0
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

## 工夫した点
### レスポンシブデザインの実装
- メディアクエリを活用し、様々な画面サイズに対応
- スマートフォンユーザーの使いやすさを重視したUI/UXデザイン
- 画像のサイズ最適化による表示速度の向上
- タッチデバイスでの操作性を考慮したボタンサイズとレイアウト

### その他の工夫
- 直感的な操作フローの設計
- エラーメッセージの日本語対応
- セキュリティ対策の実装
- パフォーマンスの最適化

## 使用技術
### フロントエンド
- HTML/CSS
- JavaScript
- Bootstrap 4.5.0

### バックエンド
- Ruby 3.2.6
- Ruby on Rails 7.0.0
- MySQL 5.6.51

### インフラ
- AWS (EC2, S3)
- Nginx
- Unicorn
- Capybara


### テスト
- RSpec
- FactoryBot

### その他
- Git/GitHub（バージョン管理）
- VSCode/Cursor（開発環境）


