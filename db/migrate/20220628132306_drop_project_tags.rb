class DropProjectTags < ActiveRecord::Migration[6.0]
  def change
    drop_table :project_tags
  end
end
