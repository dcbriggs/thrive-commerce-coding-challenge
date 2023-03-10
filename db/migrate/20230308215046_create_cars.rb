class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :make
      t.string :color
      t.integer :mileage
      t.boolean :is_for_sale

      t.timestamps
    end
  end
end
