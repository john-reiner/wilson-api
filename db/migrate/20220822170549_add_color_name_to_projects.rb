class AddColorNameToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :color_name, :string
  end
end
