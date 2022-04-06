class CreateProjectListTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :project_list_tasks do |t|
      t.string :content
      t.string :due_date
      t.boolean :completed
      t.references :project_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
