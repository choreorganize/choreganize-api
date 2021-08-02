class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :households, :housecode_digest, :password_digest
  end
end