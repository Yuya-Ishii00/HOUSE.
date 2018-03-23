class Category < ApplicationRecord
  belongs_to :item
  
  validates :name, presence: true
  
  has_many :items
  
end
