class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.references :listable, polymorphic: true, null: false
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
