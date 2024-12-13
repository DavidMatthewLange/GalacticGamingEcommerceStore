class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items # Associates Orders with Products through OrderItems.

  # Validations
  validates :user_id, presence: true
  validates :status, presence:  true,
                     inclusion: { in:      %w[pending completed cancelled],
                                  message: "%<value>s is not a valid status" }
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # Sets the default status of new orders to pending.
  after_initialize :set_status, if: :new_record?

  private

  def set_status
    self.status ||= "pending"
  end
end
