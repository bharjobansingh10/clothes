class Product < ApplicationRecord
    mount_uploader :image, AvatarUploader
    belongs_to :category
    has_many :order_items
    def self.search(search)
        if search
            self.where("name ilike ?", "%#{search}%")
        else
            self.all
        end
    end
end
