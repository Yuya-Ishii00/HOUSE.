class Category < ApplicationRecord
  # belongs_to :item これは必要ありません。Categoryが１に対してItemが多です。
  
  #validates :name, presence: true 下記のように修正しています。フォームから入力される値はDBをパンクさせないように必ず文字制限は入れましょう。
  validates :name, presence: true, length: { maximum: 30 }

  has_many :items
end
