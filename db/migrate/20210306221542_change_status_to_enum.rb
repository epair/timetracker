class ChangeStatusToEnum < ActiveRecord::Migration[6.0]
  def up
    change_column :entries, :status, :integer
  end

  def down
    change_column :entries, :status, :boolean
  end
end
