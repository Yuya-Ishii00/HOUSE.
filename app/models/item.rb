class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category #追加しています。
  
  validates :user_id, presence: true
  validates :category_id, presence: true #追加しています。
  validates :comment, presence: true, length: { maximum: 100 }
end
