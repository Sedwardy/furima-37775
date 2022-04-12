class Selector < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category


  validates :title, :text, presence: true
  validates :categoty_id, numericality: { other_than: 1 , message: "can't be blank"}
end