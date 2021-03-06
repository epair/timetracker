class RenameProjectTagsToTags < ActiveRecord::Migration[6.0]
  def change
    rename_column :entry_project_tags, :project_tag_id, :tag_id
    rename_index :entry_project_tags, 'index_entry_project_tags_on_project_tag_id', 'index_entry_project_tags_on_tag_id'
    rename_table :project_tags, :tags
  end
end
