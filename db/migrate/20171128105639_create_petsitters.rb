class CreatePetsitters < ActiveRecord::Migration[5.0]
  def change
    create_table :petsitters do |t|
      t.string :description
      t.string :category
      t.string :location
      t.boolean :availability
      t.references :user, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
