class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :pet, foreign_key: true
      t.references :user, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :status
      t.integer :price
      t.timestamps
    end
  end
end
