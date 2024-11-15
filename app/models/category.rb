class Category < ApplicationRecord
  # Many-to-many relationship with Products
  has_many :product_categories
  has_many :products, through: :product_categories
end
