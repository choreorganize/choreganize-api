class RemoveUserIdFromRoommates < ActiveRecord::Migration[5.2]
  def change
    remove_column :roommates, :user_id
  end
end
