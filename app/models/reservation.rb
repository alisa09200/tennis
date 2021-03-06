class Reservation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :participants
  belongs_to :city
  belongs_to :user
  has_many :comments

  validates :city_id, numericality: { other_than: 1 }
end
