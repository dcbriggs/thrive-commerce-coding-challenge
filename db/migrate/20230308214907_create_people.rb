class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.string :telephone

      t.timestamps
    end
  end
end
