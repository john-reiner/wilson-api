class DropProjectListTasks < ActiveRecord::Migration[6.0]
  def change
    drop_table :project_list_tasks
  end
end
