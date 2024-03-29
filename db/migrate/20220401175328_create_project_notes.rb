class CreateProjectNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :project_notes do |t|
      t.string :title
      t.text :content
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
