class CreateRides < ActiveRecord::Migration[7.0]
  def change
    create_table :rides do |t|
      t.integer :ride_area

      t.timestamps
    end
  end
end
