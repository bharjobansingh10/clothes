class ContactU < ApplicationRecord

  validates :title, :description, presence: true


  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "title", "updated_at"]
  end
end
