class Merchandise < ApplicationRecord

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :goods_name,          null: false 
  validates :price,               null: false 
  validates :prefecture_id,       null: false 
  validates :explain,             null: false 
  validates :category_id,         null: false 
  validates :condition_id,        null: false 
  validates :delivery_fee_id,     null: false 
  validates :date_of_shipping_id, null: false 
end
