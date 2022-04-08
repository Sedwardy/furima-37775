class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :merchandises
  has_many :purchases

  validates :nickname,           presence: true
  validates :last_name,          presence: true
  validates :first_name,         presence: true  
  validates :hurigana_last_name, presence: true
  validates :hurigana_last_name, presence: true
  validates :date_of_birth,      presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'}
end



  