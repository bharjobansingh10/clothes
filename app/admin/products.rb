ActiveAdmin.register Product do

  actions :index, :edit, :update, :create, :destroy, :new
  permit_params :name, :price, :description, :category_id, :image, :is_featured

end
