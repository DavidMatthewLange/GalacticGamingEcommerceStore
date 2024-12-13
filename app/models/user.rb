class User < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true,
  format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 8 },
                       format: { with:    /[A-Z]/,
                                 message: "must include at least one uppercase letter" }
end
