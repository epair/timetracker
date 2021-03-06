class RenameEntryProjectTagsToEntryTags < ActiveRecord::Migration[6.0]
  def change
    rename_table :entry_project_tags, :entry_tags
  end
end
