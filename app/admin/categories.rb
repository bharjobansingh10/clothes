ActiveAdmin.register Category do

  actions :index, :edit, :update, :create, :destroy, :new
  permit_params :name, :description

  Formtastic::FormBuilder.perform_browser_validations = true

end
