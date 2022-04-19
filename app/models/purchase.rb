class Purchase < ApplicationRecord

  belongs_to :user
  belongs_to :merchandise
  has_one    :address
  
  #フォームオブジェクトに記入したのでvalidates :merchandise, null: falseは削除して良い

end
