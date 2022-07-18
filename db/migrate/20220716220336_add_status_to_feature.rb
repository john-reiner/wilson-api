class AddStatusToFeature < ActiveRecord::Migration[6.0]
  def change
    add_column :features, :status, :integer, default: 0 
  end
end
