class AddImageToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :image, :text
  end
end
