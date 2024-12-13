class StaticPage < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :content, presence: true
  validates :slug, presence: true, uniqueness: true,
format: { with:    /\A[a-z0-9-]+\z/,
          message: "can only contain lowercase letters, numbers, and hyphens" }

  def self.ransackable_attributes(_auth_object = nil)
    ["content", "created_at", "id", "id_value", "slug", "title", "updated_at"]
  end
end
