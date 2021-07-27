class CreateChores < ActiveRecord::Migration[5.2]
  def change
    create_table :chores do |t|
      t.references :household, foreign_key: true
      t.string :task_name
      t.text :description
      t.integer :weight
      t.integer :frequency
      t.boolean :outdoor

      t.timestamps
    end
  end
end
