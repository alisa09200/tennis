class Reservation < ApplicationRecord
  has_many :participants
  belongs_to :city
end
