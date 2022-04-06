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
|     nickname       |  string  | null: false |
|    last_name       |  string  | null: false |
|    first_name      |  string  | null: false |
| hurigana_last_name |  string  | null: false |
| hurigana_first_name|  string  | null: false |
|      email         |  string  | null: false,unique:true |
| encrypted_password |  string  | null: false |
|   date_of_birth    |   date   | null: false |

### Association
- has_many :merchandises
- has_many :purchases


## Merchandisesテーブル
|      Column        |   Type   |   Options   |
|--------------------|----------|-------------|
|      user          |references| null: false,foreign_key: true |
|     goods_name     |  string  | null: false |
|       price        | integer  | null: false |
|   prefecture_id    | integer  | null: false |
|      explain       |   text   | null: false |
|     category_id    | integer  | null: false |
|    condition_id    | integer  | null: false |
|    delivery_fee    | integer  | null: false |
|  date_of_shipping  |   date   | null: false |



### Association
- belongs_to :user
- has_one :purchase


## Purchasesテーブル
|      Column        |   Type   |   Options   |
|--------------------|----------|-------------|
|       user         |references| null: false,foreign_key: true |
|    goods_name      |references| null: false,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :merchandise
- has_one :address

## Addressesテーブル
|      Column        |   Type   |   Options   |
|--------------------|----------|-------------|
|       user         |references| null: false,foreign_key: true |
|   purchased_stuff  |references| null: false,foreign_key: true |
|     purchaser      |references| null: false,foreign_key: true |
|     post_code      | string   | null: false |
|    prefecture_id   | integer  | null: false |
|       city         | string   | null: false |
|   street_number    | string   | null: false |
|    building_name   | string   |             |
|    phone_number    | string   | null: false |

### Association
- belongs_to :purchase
