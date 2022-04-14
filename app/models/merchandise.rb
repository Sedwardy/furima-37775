class Merchandise < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :date_of_shipping
  belongs_to :delivery_fee
  belongs_to :prefecture

  belongs_to :user
  #購入機能実装時 has_one :purchase
  has_one_attached :image

  validates :goods_name,          null: false

  validates :price,               null: false, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                                  presence: { message: "can't be blank"}
  validates :prefecture_id,       null: false 
  validates :explain,             null: false
  validates :category_id,         null: false 
  validates :condition_id,        null: false 
  validates :delivery_fee_id,     null: false 
  validates :date_of_shipping_id, null: false 

  validates :goods_name, :explain, :image, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }  
  validates :delivery_fee_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :date_of_shipping_id, numericality: { other_than: 1 } 
end
