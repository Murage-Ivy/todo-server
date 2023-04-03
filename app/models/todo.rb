class Todo < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :status, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  belongs_to :user
end
