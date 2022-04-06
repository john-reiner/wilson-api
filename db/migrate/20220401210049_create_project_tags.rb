class CreateProjectTags < ActiveRecord::Migration[6.0]
  def change
    create_table :project_tags do |t|
      t.string :key
      t.string :value
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
