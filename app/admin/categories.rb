ActiveAdmin.register Category do

  actions :index, :edit, :update, :create, :destroy, :new
  permit_params :name, :description
  
end
