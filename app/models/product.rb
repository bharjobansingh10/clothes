class Product < ApplicationRecord
    mount_uploader :image, AvatarUploader
    belongs_to :category
    has_many :order_items
end
