class AddAvailableToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :available, :integer
  end
end
