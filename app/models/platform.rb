class Platform < ApplicationRecord
  has_many :product_platforms, dependent: :destroy
  has_many :products, through: :product_platforms

  validates :name, presence: true, length: { maximum: 255 }
end
