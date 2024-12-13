class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :unit_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :tax_rate, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :order_id, presence: true
  validates :product_id, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    ["created_at", "id", "order_id", "product_id", "quantity", "tax_rate", "unit_price",
     "updated_at"]
  end
end
