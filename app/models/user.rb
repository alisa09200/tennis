class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :reservations
  has_many :participants
  def self.guest
    find_or_create_by(email: "test@com") do |user|
      user.password = 123456
    end
  end
end
