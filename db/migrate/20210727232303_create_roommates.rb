class CreateRoommates < ActiveRecord::Migration[5.2]
  def change
    create_table :roommates do |t|
      t.integer :user_id
      t.references :household, foreign_key: true

      t.timestamps
    end
  end
end
