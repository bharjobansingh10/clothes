class Customer < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders

  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "email", "encrypted_password", "id", "name", "phone_number", "province", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end
end
