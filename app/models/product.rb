class Product < ApplicationRecord
  belongs_to :category
  belongs_to :platform
  has_many :order_items
  has_many :orders, through: :order_items # Associate Products and Orders through OrderItems
end
