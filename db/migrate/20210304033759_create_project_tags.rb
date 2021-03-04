class CreateProjectTags < ActiveRecord::Migration[6.0]
  def change
    create_table :project_tags do |t|
      t.references :project, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps
    end
  end
end
