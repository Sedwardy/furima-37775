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
|      nickname      |  string  | null: false |
|   zennkaku name    |  string  | null: false |
|   hankaku name     |  string  | null: false |
|      email         |  string  | null: false,unique:true |
| encrypted_password |  string  | null: false |
|      profile       |   text   | null: false |
|   date of birth    |   date   | null: false |

### Association
- has_many :merchandises
- has many :purchases


## Merchandisesテーブル
|      Column        |   Type   |   Options   |
|--------------------|----------|-------------|
|      user          |references| null: false,foreign_key: true |
|     goods_name     |  string  | null: false,foreign_key: true |
|       price        | integer  | null: false,foreign_key: true |
|    exhibitor_id    | integer  | null: false |
|      explain       |   text   | null: false |
|     category_id    | integer  | null: false |
|    condition_id    | integer  | null: false |
|       image        |  string  | null: false |


### Association
- belongs_to :user
- has_one :purchase


## Purchasesテーブル
|      Column        |   Type   |   Options   |
|--------------------|----------|-------------|
|       user         |references| null: false,foreign_key: true |
|     postcode       | integer  | null: false |
|    prefecture_id   | integer  | null: false |
|       city         | string   | null: false |
|      street        | string   | null: false |
|    building name   | string   | null: false |
|    phone number    | integer  | null: false |

### Association
- belongs_to :user
- belongs_to :merchandise
- has_one :address

## Addressesテーブル
|      Column        |   Type   |   Options   |
|--------------------|----------|-------------|
|       user         |references| null: false,foreign_key: true |
|    delivery fee    |  integer | null: false |
|     prefecture     |  string  | null: false |
|       city         | string   | null: false |
|      street        | string   | null: false |
|    building name   | string   | null: false |
|    phone number    | integer  | null: false |
|  date of shipping  |   date   | null: false |

### Association
- belongs_to :purchase
