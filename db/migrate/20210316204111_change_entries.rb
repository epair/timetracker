class ChangeEntries < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:entries, :project_id, true)
  end
end
