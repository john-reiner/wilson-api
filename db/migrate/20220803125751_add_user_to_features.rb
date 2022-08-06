class AddUserToFeatures < ActiveRecord::Migration[6.0]
  def change
    add_reference :features, :user, null: false, foreign_key: true
  end
end
