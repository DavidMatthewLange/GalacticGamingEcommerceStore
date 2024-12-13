class ProductCategory < ApplicationRecord
  belongs_to :product
  belongs_to :category

  validates :product, presence: true
  validates :category, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    ["category_id", "created_at", "id", "id_value", "product_id", "updated_at"]
  end
end
