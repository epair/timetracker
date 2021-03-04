class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.references :project, index: true, foreign_key: true, null: false
      t.references :project_tag, index: true, foreign_key: true
      t.boolean :on, null: false
      t.text :notes

      t.timestamps
    end
  end
end
