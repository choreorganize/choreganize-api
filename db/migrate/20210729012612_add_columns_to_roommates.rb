class AddColumnsToRoommates < ActiveRecord::Migration[5.2]
  def change
    add_column :roommates, :name, :string
    add_column :roommates, :email, :string
    add_column :roommates, :google_id, :string
    add_column :roommates, :token, :string
  end
end
