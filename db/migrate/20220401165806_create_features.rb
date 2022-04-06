class CreateFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :features do |t|
      t.string :title
      t.text :description
      t.string :due_date
      t.boolean :public
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
