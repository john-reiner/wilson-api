class DropProjectLists < ActiveRecord::Migration[6.0]
  def change
    drop_table :project_lists
  end
end
