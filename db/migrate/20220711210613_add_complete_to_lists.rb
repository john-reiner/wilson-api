class AddCompleteToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :complete, :boolean
  end
end
