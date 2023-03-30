class User < ApplicationRecord
  validates :email, presence: :true, uniqueness: :true
  validates :password, presence: :true, length: { maximum: 8 }
  validates :password_confirmation, presence: :true, length: { maximum: 8 }
  has_secure_password
  has_many :todos
end
