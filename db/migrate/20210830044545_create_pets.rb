class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :pet_type
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
