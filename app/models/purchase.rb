class Purchase < ApplicationRecord
  attr_accessor :token
  belongs_to :user
  belongs_to :merchandise
  has_one    :address
end
