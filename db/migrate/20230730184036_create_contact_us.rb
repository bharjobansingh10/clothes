class CreateContactUs < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_us do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
