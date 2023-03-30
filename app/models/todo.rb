class Todo < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :status, presence: true
  belongs_to :user
end
