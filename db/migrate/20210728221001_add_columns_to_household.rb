class AddColumnsToHousehold < ActiveRecord::Migration[5.2]
  def change
    add_column :households, :city, :string
    add_column :households, :state, :string
  end
end
