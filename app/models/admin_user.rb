class AdminUser < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :encrypted_password, presence: true
  validates :encrypted_password, length: { minimum: 6 }

  def self.ransackable_attributes(_auth_object = nil)
    ["created_at", "email", "id", "remember_created_at", "reset_password_sent_at", "updated_at"]
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
