class Address < ApplicationRecord

  belongs_to :purchase

  #以下の記述は削除して良い
  #validates :purchase,      null: false,foreign_key: true 
  #validates :post_code,     null: false 
  #validates :prefecture_id, null: false 
  #validates :city,          null: false 
  #validates :street_number, null: false 
  #validates :building_name           
  #validates :phone_number,  null: false 

end
