class Item < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :comment, presence: true, length: { maximum: 100 }
end
