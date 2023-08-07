class Product < ApplicationRecord
    mount_uploader :image, AvatarUploader
    belongs_to :category
    has_many :order_items
    validates :name, :price, :bio, presence: true
    validates :name, length: {maximum: 30}

    # has_many :orders, through: :order_items

    def self.search(search)
        if search
            self.joins(:category).where("products.name ilike ? or categories.name ilike ? ", "%#{search}%","%#{search}%")
        else
            self.all
        end
    end

    

    def self.ransackable_attributes(auth_object = nil)
        %w[category_id created_at description id image is_featured name price updated_at]
    end

    def self.ransackable_associations(auth_object = nil)
        %w[category order_items]
    end
end
