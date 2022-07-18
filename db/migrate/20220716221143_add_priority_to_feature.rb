class AddPriorityToFeature < ActiveRecord::Migration[6.0]
  def change
    add_column :features, :priority, :integer, default: 0
  end
end
