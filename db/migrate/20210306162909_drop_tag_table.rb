class DropTagTable < ActiveRecord::Migration[6.0]
  def change
    remove_index :project_tags, :tag_id
    remove_foreign_key :project_tags, :tags
    remove_column :project_tags, :tag_id, :integer
    drop_table :tags do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
