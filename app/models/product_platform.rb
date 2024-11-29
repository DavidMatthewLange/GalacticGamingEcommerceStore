class ProductPlatform < ApplicationRecord
  belongs_to :product
  belongs_to :platform

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "id_value", "platform_id", "product_id", "updated_at" ]
  end
end
