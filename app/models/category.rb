class Category < ApplicationRecord
    has_many :products

    validates :name, presence: true
    validates :description, length: {maximum: 500}

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "description", "id", "name", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["products"]
    end
end
