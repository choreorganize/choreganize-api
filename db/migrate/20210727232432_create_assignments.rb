class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.boolean :completed
      t.references :roommate, foreign_key: true
      t.references :chore, foreign_key: true

      t.timestamps
    end
  end
end
