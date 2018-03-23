class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :items
  
end

  def check_image
    if !['.jpg', '.png', '.gif'].include?(File.extname(name).downcase)
        errors.add(:image, "JPG, PNG, GIFのみアップロードできます。")
    elsif file.size > 1.megabyte
        errors.add(:image, "1MBまでアップロードできます")
    end
  end