class AddColumnsToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :available_from, :date
    add_column :pets, :available_till, :date
    add_column :pets, :booking_requirements, :text
  end
end
