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
|   date of birth    |   date   | null: false |

### Association
- has_many :merchandises
- has many :purchases


## Merchandiseテーブル
|      Column        |   Type   |   Options   |
|--------------------|----------|-------------|
|      user          |references| null: false,foreign_key: true |
|     goods_name     |  string  | null: false,foreign_key: true |
|       price        |  string  | null: false,foreign_key: true |
|     exhibitor      |  string  | null: false |
|      explain       |   text   | null: false |
|      category      |  string  | null: false |
|      condition     |  string  | null: false |

### Association
- belongs_to :user
- has_one :purchase


## Purchaseテーブル
|      Column        |   Type   |   Options   |
|--------------------|----------|-------------|
|      user          |references| null: false,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :merchandise
- has_one :address

## Addressテーブル
|      Column        |   Type   |   Options   |
|--------------------|----------|-------------|
|       user         |references| null: false,foreign_key: true |
|       place        |  string  | null: false |
|    delivery fee    |  integer | null: false |
|     prefecture     |  string  | null: false |
|  date of shipping  |   date   | null: false |

### Association
- belongs_to :purchase
