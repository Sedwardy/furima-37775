class PurchaseAddress 

  include ActiveModel::Model
  attr_accessor  :merchandise_id, :post_code, :prefecture_id, :city, :street_number, :building_name, :phone_number, :user_id, :token

  with_options presence: true do
    validates :post_code,format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city          
    validates :street_number           
    validates :phone_number, format: { with: /\A[\d]{10,11}\z/ }
    validates :merchandise_id
    validates :token
    validates :user_id
  end

  def save
    purchase = Purchase.create(merchandise_id: merchandise_id, user_id: user_id, token: token)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end