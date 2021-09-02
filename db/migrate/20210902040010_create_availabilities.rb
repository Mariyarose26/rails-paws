class CreateAvailabilities < ActiveRecord::Migration[6.1]
  def change
    create_table :availabilities do |t|
      t.date :available_from
      t.date :available_till
      t.text :booking_requirements
      t.references :pet
      t.timestamps
    end
  end
end
