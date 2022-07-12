class AddStatusToList < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :status, :integer, default: 0 
  end
end
