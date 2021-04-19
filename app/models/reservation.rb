class Reservation < ApplicationRecord
  has_many :participants
end
