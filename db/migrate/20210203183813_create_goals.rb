class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :name
      t.text :description
      t.boolean :completed
      t.string :rgb
      t.string :due_date
      t.string :completed_date
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
