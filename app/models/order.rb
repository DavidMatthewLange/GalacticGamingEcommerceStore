class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items # Associates Orders with Products through OrderItems.

  # Validations
  validates :status, presence: true
  validates :total_price, presence: true

  # Sets the default status of new orders to pending.
  after_initialize :set_status, if: :new_record?

  private
  def set_status
    self.status ||= "pending"
  end
end
