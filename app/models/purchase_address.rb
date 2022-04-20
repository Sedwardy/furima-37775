class PurchaseAddress 

  include ActiveModel::Model
  attr_accessor :purchase, :merchandise, :post_code, :prefecture_id, :city, :street_number, :building_name, :phone_number, :user_id

  # ここにバリデーションの処理を書く 
  validates :purchase,      presence: true
  validates :post_code,     presence: true 
  validates :prefecture_id, presence: true 
  validates :city,          presence: true
  validates :street_number, presence: true           
  validates :phone_number,  presence: true 
  validates :merchandise,   presence: true
  validates :token,         presence: true


  def save
    # 各テーブルにデータを保存する処理を書く
    @purchase = Purchase.create(merchandise: merchandise, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture.id, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number)
  end
end