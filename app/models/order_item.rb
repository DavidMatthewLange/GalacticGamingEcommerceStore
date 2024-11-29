class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "id_value", "order_id", "product_id", "quantity", "tax_rate", "unit_price", "updated_at" ]
  end
end
