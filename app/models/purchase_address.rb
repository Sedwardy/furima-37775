class PurchaseAddress 

  include ActiveModel::Model
  attr_accessor  :merchandise_id, :post_code, :prefecture_id, :city, :street_number, :building_name, :phone_number, :user_id, :token

  
  validates :post_code,format: { with: /\A\d{3}-\d{4}\z/ },  presence: true
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :city,          presence: true
  validates :street_number, presence: true           
  validates :phone_number,  presence: true, format: { with: /\A[\d]{10,11}\z/ }
  validates :merchandise_id,presence: true
  validates :token,         presence: true
  validates :user_id,       presence: true

  def save
    purchase = Purchase.create(merchandise_id: merchandise_id, user_id: user_id, token: token)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end