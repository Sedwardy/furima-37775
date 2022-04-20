class Purchase < ApplicationRecord
  attr_accessor :token
  belongs_to :user
  belongs_to :merchandise
  has_one    :address
  
  #フォームオブジェクトに記入したので,削除して良い
  #validates :merchandise, null: false
  #validates :token, presence: true
end
