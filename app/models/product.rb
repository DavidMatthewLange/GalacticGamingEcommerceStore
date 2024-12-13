class Product < ApplicationRecord
  # Many-to-many relationship with both Categories and Products
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  has_many :product_platforms, dependent: :destroy
  has_many :platforms, through: :product_platforms

  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items # Associate Products and Orders through OrderItems

  # For ActiveStorage image uploads
  has_one_attached :image

  validates :name, :categories, :platforms, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  # Fetches and attaches image from the API
  def attach_image_from_api(url)
    return if url.blank?

    io = URI.open(url)
    image.attach(io: io, filename: "#{SecureRandom.uuid}.jpg")
  rescue StandardError => e
    Rails.logger.error("Failed to attach image: #{e.message}")
  end

  # Displays the image uploaded by admin, otherwise fallback to IGDB API image.
  def display_image
    image.attached? ? image : image_url
  end

  def self.ransackable_associations(_auth_object = nil)
    ["categories",
     "image_attachment",
     "image_blob",
     "order_items",
     "orders",
     "platforms",
     "product_categories",
     "product_platforms"]
  end

  def self.ransackable_attributes(_auth_object = nil)
    ["category_id",
     "created_at",
     "description",
     "id",
     "id_value",
     "image_url",
     "name",
     "platform_id",
     "price",
     "stock_qty",
     "updated_at"]
  end
end
