class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :pet, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.integer :status
      t.timestamps
    end
  end
end
