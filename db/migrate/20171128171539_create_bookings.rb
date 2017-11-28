class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :petsitter, foreign_key: true
      t.date :date_start
      t.date :date_end
      t.integer :total_price
      t.string :status

      t.timestamps
    end
  end
end
