class RenameOnToStatus < ActiveRecord::Migration[6.0]
  def change
    rename_column :entries, :on, :status
  end
end
