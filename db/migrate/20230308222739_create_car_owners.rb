class CreateCarOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :car_owners do |t|
      t.references :car, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.date :date_of_sale
      t.integer :price
      t.integer :mileage_at_sale

      t.timestamps
    end
  end
end
