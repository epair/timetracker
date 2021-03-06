class RemoveProjectTagIdFromEntry < ActiveRecord::Migration[6.0]
  def change
    remove_column :entries, :project_tag_id, :integer
  end
end
