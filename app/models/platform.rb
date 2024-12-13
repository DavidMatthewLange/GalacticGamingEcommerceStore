class Platform < ApplicationRecord
  has_many :product_platforms, dependent: :destroy
  has_many :products, through: :product_platforms

  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :manufacturer, presence: true, length: { maximum: 255 }
  validates :release_date, presence: true, comparison: { less_than_or_equal_to: Time.zone.today }
end
