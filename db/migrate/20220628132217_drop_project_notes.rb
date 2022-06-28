class DropProjectNotes < ActiveRecord::Migration[6.0]
  def change
    drop_table :project_notes
  end
end
