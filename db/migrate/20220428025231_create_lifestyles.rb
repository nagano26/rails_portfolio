class CreateLifestyles < ActiveRecord::Migration[7.0]
  def change
    create_table :lifestyles do |t|
      t.integer :user_id
      t.integer :price_life
      t.text :house_life
      t.text :dating_life
      t.text :system_life

      t.timestamps
    end
  end
end
