class CreateEntryProjectTags < ActiveRecord::Migration[6.0]
  def change
    create_table :entry_project_tags do |t|
      t.references :entry, index: true, foreign_key: true
      t.references :project_tag, index: true, foreign_key: true

      t.timestamps
    end
  end
end
