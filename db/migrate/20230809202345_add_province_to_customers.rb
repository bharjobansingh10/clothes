class AddProvinceToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :province, :string
  end
end
