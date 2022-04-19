class Address < ApplicationRecord

  belongs_to :purchase

  validates :purchase,      null: false,foreign_key: true 
  validates :post_code,     null: false 
  validates :prefecture_id, null: false 
  validates :city,          null: false 
  validates :street_number, null: false 
  validates :building_name           
  validates :phone_number,  null: false 

end
