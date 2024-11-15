class Product < ApplicationRecord
  # Many-to-many relationship with both Categories and Products
  has_many :product_categories
  has_many :categories, through: :product_categories

  has_many :product_platforms
  has_many :platforms, through: :product_platforms

  has_many :order_items
  has_many :orders, through: :order_items # Associate Products and Orders through OrderItems

  has_one_attached :image

  validates :title, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
