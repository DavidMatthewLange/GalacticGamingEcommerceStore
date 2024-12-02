class Product < ApplicationRecord
  # Many-to-many relationship with both Categories and Products
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  has_many :product_platforms, dependent: :destroy
  has_many :platforms, through: :product_platforms

  has_many :order_items
  has_many :orders, through: :order_items # Associate Products and Orders through OrderItems

  has_one_attached :image

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :categories, presence: true
  validates :platforms, presence: true

  # Displays the image uploaded by admin, otherwise fallback to IGDB API image.
  def display_image
    if
      image.attached?
        image
    else
      image_url
    end
  end

  def self.ransackable_associations(auth_object = nil)
  [ "categories",
    "image_attachment",
    "image_blob",
    "order_items",
    "orders",
    "platforms",
    "product_categories",
    "product_platforms" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "category_id",
     "created_at",
     "description",
     "id",
     "id_value",
     "image_url",
     "name",
     "platform_id",
     "price",
     "stock_qty",
     "updated_at" ]
  end
end
