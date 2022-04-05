# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計
## Usersテーブル
|      Column        |   Type   |   Options   |
|--------------------|----------|-------------|
|      name          |  string  | null: false |
|      email         |  string  | null: false,unique:true |
| encrypted_password |  string  | null: false |
|      profile       |   text   | null: false |
|      email         |   text   | null: false |
| encrypted_password |   text   | null: false |
### Association
- has_many :merchandise
- has many :purchase
## Merchandiseテーブル
|      Column        |   Type   |   Options   |
|--------------------|----------|-------------|
|      user_id       |references| null: false,foreign_key: true |
|     goods_name     |  string  | null: false |
|       price        |  string  | null: false |
|     exhibitor      |  string  | null: false |
### Association
- belongs_to :user
- has_one :purchase
## Purchaseテーブル
|      Column        |   Type   |   Options   |
|--------------------|----------|-------------|
|      user_id       |references| null: false,foreign_key: true |
|       bought       |  string  | null: false |
### Association
- belongs_to :user
- belongs_to :merchandise
## Addressテーブル
|      Column        |   Type   |   Options   |
|--------------------|----------|-------------|
|       user_id      |references| null: false,foreign_key: true |
|       place        |  string  | null: false |

### Association
- belongs_to :purchase
